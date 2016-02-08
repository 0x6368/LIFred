#!/usr/bin/env ruby
# encoding: utf-8


require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require './helper'
require './constants'

require_relative 'bundle/bundler/setup'
require 'alfred'
require 'json'
require 'curb'

Alfred.with_friendly_error do |alfred|

  if ARGV[0] == 'more_info'
    `/usr/bin/ruby ./lifx_config_run_script.rb more_info`
  else
    # Check whether the client token is set yet
    if get_preference(alfred, 'client_token') != ''
      # Switch the action
      case ARGV[0]
        when 'refresh'
          # Create the request
          request = Curl::Easy.new("#{HTTP_API_URL}lights/all/")

          # Set the authorization header
          request.headers['Authorization'] = "Bearer #{get_preference(alfred, 'client_token')}"

          # Execute the request
          request.perform

          # Check whether the client token is wrong
          if request.status == '401 Unauthorized'
            puts 'The client token seems to be invalid.'

            # Save the new bulbs to the file
            File.open(BULBS_FILE_NAME, 'w') { |file| file.write('') }
          else
            # Create the bulbs array
            bulbs = {}

            # Parse the json string
            new_bulbs = JSON.parse(request.body_str)

            # Iterate all bulbs
            new_bulbs.each { |bulb|
              # Set the new bulb
              bulbs[bulb['id']] = bulb
            }

            # Save the new bulbs to the file
            File.open(BULBS_FILE_NAME, 'w') { |file| file.write(JSON.generate(bulbs)) }
          end
          
          # Create the request
          request = Curl::Easy.new("#{HTTP_API_URL}scenes/")

          # Set the authorization header
          request.headers['Authorization'] = "Bearer #{get_preference(alfred, 'client_token')}"

          # Execute the request
          request.perform

          # Check whether the client token is wrong
          if request.status == '401 Unauthorized'
            puts 'The client token seems to be invalid.'

            # Save the new bulbs to the file
            File.open(SCENES_FILE_NAME, 'w') { |file| file.write('') }
          else
            # Create the scenes array
            scenes = {}

            # Parse the json string
            new_scenes = JSON.parse(request.body_str)

            # Iterate all bulbs
            new_scenes.each { |scene|
              # Set the new bulb
              scenes[scene['uuid']] = scene
            }

            # Save the new bulbs to the file
            File.open(SCENES_FILE_NAME, 'w') { |file| file.write(JSON.generate(scenes)) }
          end
          puts 'Bulbs and Scenes successfully refreshed.'
          if ARGV[1] == 'update_version'
            # Set the new version number
            set_preference(alfred, CONFIG_LAST_VERSION_KEY, ARGV[2].to_f)
          end
        when 'toggle', 'state', 'breathe', 'pulse', 'activate_scene'
          # Get the action
          action = ARGV[0]
          
          # Set up the target
          target = 'lights'
          
          # Check whether the action needs to target lights
          if %w(toggle state breathe pulse).include? action
            target = 'lights'
          elsif action == 'activate_scene'
            target = 'scenes'
          end

          # Check whether the action needs the 'effects' url prefix
          if %w(breathe pulse).include? action
            action_url_prefix = 'effects/'
          else
            action_url_prefix = ''
          end
          
          # Check whether the action needs to target lights
          if %w(toggle state breathe pulse).include? action
            # Get the selector
            selector = ARGV[1]
          elsif action == 'activate_scene'
            # Get the selector
            selector = "scene_id:#{ARGV[1]}"
          end
            
          # Set up the body
          body = ''  
                    
          # Check whether we want to set the state to on or off
          if %w(on off).include? ARGV[2]
            body = "{\"power\": \"#{ARGV[2]}\"}"
          # Check whether we want to set the color
          elsif %w(color).include? ARGV[2]
            body = "{\"color\": \"#{ARGV[3]}\"}"
          # Check whether we want to set the color
          elsif %w(breathe pulse).include? action
            body = "{\"color\": \"#{ARGV[2]}\",\"persist\": false,\"power_on\": true}"
            print body
          end

          # Set the default http method
          http_method = 'post'

          # Check whether the http method should be PUT
          if %w(state activate_scene).include? action
            http_method = 'put'
          end

          # Create the request
          response = Curl::Easy.send('http_' + http_method, "#{HTTP_API_URL}#{target}/#{selector}/#{action != 'activate_scene' ? action_url_prefix + action : 'activate'}", body) do |request|
            # Set the authorization header
            request.headers['Authorization'] = "Bearer #{get_preference(alfred, 'client_token')}"
            request.headers['Content-Type'] = "application/json"

            # Enable verbose mode
            request.verbose = true
          end

          # Check whether the client token is wrong
          if response.status == '401 Unauthorized'
            puts 'The client token seems to be invalid.'

            # Save the new bulbs to the file
            File.open(BULBS_FILE_NAME, 'w') { |file| file.write('') }
          elsif response.status == '200 OK'
            case action
              when 'toggle'
                puts 'Bulb(s) toggled successfully.'
              when 'state'
                # Check whether we want to set the state to on or off
                if %w(on off).include? ARGV[2]
                  puts "Bulb(s) successfully powered #{ARGV[3]}."
                # Check whether we want to set the color
                elsif %w(color).include? ARGV[2]
                  puts "Color set successfully to #{ARGV[3]}."
                end
              when 'breathe'
                puts 'Bulb(s) breathed successfully.'
              when 'pulse'
                puts 'Bulb(s) pulsed successfully.'
            end
          elsif response.status == '207 Multi-Status'
            results = JSON.parse(response.body_str)['results']
            
            # Set up the not reachable array
            not_reachable = []
            
            # Iterate all bulbs
            results.each { |result|
              if result['status'] == 'timed_out' || result['status'] == 'offline'
                not_reachable.push("\"#{result['label']}\"")
              end
            }
            if not_reachable.empty?
              puts "All actions successfully performed."
            elsif not_reachable.length == 1
              puts "The Bulb #{not_reachable.first} is not reachable."
            else
              puts "The Bulbs #{not_reachable.take(not_reachable.length-1).join(", ")} and #{not_reachable.last} are not reachable."
            end
          else
            error = JSON.parse(response.body_str)
            puts error['error']
          end
      end
    else
      # No client token set yet
      puts 'You have to set the client token first.'
    end
  end
end