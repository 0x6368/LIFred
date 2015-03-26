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
          request = Curl::Easy.new('https://api.lifx.com/v1beta1/lights/all/')

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
              # Add the 'id:' prefix to the id
              bulb[:id] = 'id:' + bulb['id']

              # Add the prefix to the label
              bulb[:label] = "the Bulb \"#{bulb['label']}\""

              # Set the new bulb
              bulbs[bulb['id']] = bulb
            }

            # Save the new bulbs to the file
            File.open(BULBS_FILE_NAME, 'w') { |file| file.write(JSON.generate(bulbs)) }

            puts 'Bulbs successfully refreshed.'
          end
        when 'toggle', 'color', 'power', 'breathe', 'pulse'
          # Get the action
          action = ARGV[0]

          # Check whether the action needs the 'effects' url prefix
          if %w(breathe pulse).include? action
            action_url_prefix = 'effects/'
          else
            action_url_prefix = ''
          end

          # Get the selector
          selector = ARGV[1]

          # Get the body
          body = ARGV[2]

          # Set the default http method
          http_method = 'post'

          # Check whether the http method should be put
          if %w(power color).include? action
            http_method = 'put'
            # Check whether the http method should be GET
          elsif %w().include? action
            http_method = 'get'
          end

          # Create the request
          response = Curl::Easy.send('http_' + http_method, "https://api.lifx.com/v1beta1/lights/#{selector}/#{action_url_prefix + action}" +
                                                              (http_method != 'post' ? "?#{body}" : ''),
                                     http_method == 'post' ? body : '') do |request|
            # Set the authorization header
            request.headers['Authorization'] = "Bearer #{get_preference(alfred, 'client_token')}"

            # Enable verbose mode
            request.verbose = true
          end

          # Check whether the client token is wrong
          if response.status == '401 Unauthorized'
            puts 'The client token seems to be invalid.'

            # Save the new bulbs to the file
            File.open(BULBS_FILE_NAME, 'w') { |file| file.write('') }
          elsif response.status == '200 OK' || response.status == '207 Multi-Status' || response.status == '201 Created'
            case action
              when 'toggle'
                puts 'Bulb(s) toggled successfully.'
              when 'color'
                puts "Color set successfully to #{ARGV[3]}."
              when 'power'
                puts "Bulb(s) successfully powered #{ARGV[3]}."
              when 'breathe'
                puts 'Bulb(s) breathed successfully.'
              when 'pulse'
                puts 'Bulb(s) pulsed successfully.'
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