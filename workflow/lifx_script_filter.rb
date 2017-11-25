#!/usr/bin/env ruby
# encoding: utf-8


require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require './helper'
require './constants'

require_relative 'bundle/bundler/setup'
require 'alfred'
require 'json'
require 'open-uri'
require 'shellwords'

Alfred.with_friendly_error do |alfred|
  # Create the feedback
  fb = alfred.feedback

  # set_preference(alfred, 'client_token', '')

  # Check whether the client token is set
  if get_preference(alfred, 'client_token') != ''
    all_bulbs = get_preference(alfred, CONFIG_SHOW_ALL_KEY, 'yes') == 'yes'
    individual_bulbs = get_preference(alfred, CONFIG_SHOW_INDIVIDUAL_KEY, 'yes') == 'yes'
    show_scenes = get_preference(alfred, CONFIG_SHOW_SCENES_KEY, 'yes') == 'yes'
    power_off = get_preference(alfred, CONFIG_SHOW_POWER_OFF_KEY, 'yes') == 'yes'
    power_on = get_preference(alfred, CONFIG_SHOW_POWER_ON_KEY, 'yes') == 'yes'
    toggle = get_preference(alfred, CONFIG_SHOW_TOGGLE_KEY, 'yes') == 'yes'
    breathe = get_preference(alfred, CONFIG_SHOW_BREATHE_KEY, 'yes') == 'yes'
    pulse = get_preference(alfred, CONFIG_SHOW_PULSE_KEY, 'yes') == 'yes'
    color = get_preference(alfred, CONFIG_SHOW_COLOR_KEY, 'yes') == 'yes'
    
    version = get_preference(alfred, CONFIG_LAST_VERSION_KEY, 1.0)
    
    # Check whether the version to version 1.01
    if version < 1.01
      # Add the item to refresh the bulbs
      fb.add_item({
                      :title => 'Refresh Bulbs and Scenes',
                      :subtitle => 'You\'ve just updated your Alfred Workflow. Please refresh your Bulbs and Scenes.',
                      :arg => 'refresh update_version 1.01'
                  })
    # There was no update before
    else
      # Check whether the user wants to see all bulbs
      if all_bulbs
        # Add the 'all' bulb
        bulbs = {:all => {
            :id => 'all',
            :label => 'all Bulbs'
        }}
      else
        # Add no bulbs
        bulbs = {}
      end

      # Check whether the user wants to see individual bulbs
      if individual_bulbs
        # Get the bulbs
        bulbs = bulbs.merge(get_bulbs)
      end
    
      # Check whether the user wants to see the scenes
      if show_scenes
        # Get the bulbs
        scenes = get_scenes()
      else
        # Add no bulbs
        scenes = {}
      end

      # Iterate all bulbs
      bulbs.each { |id, bulb|
        # Check whether the user wants to see the power off function
        if power_off
          # Add an item to power the bulb off
          fb.add_item({
                          :title => "Turn #{bulb[:label]} off",
                          :subtitle => "Turns #{bulb[:label]} off.",
                          :arg => "state #{id} off"
                      })
        end

        # Check whether the user wants to see the power on function
        if power_on
          # Add an item to power the bulb on
          fb.add_item({
                          :title => "Turn #{bulb[:label]} on",
                          :subtitle => "Turns #{bulb[:label]} on.",
                          :arg => "state #{id} on"
                      })
        end

        # Check whether the user wants to see the toggle function
        if toggle
          # Add an item to toggle the bulb
          fb.add_item({
                          :title => "Toggle #{bulb[:label]}",
                          :subtitle => "Toggles #{bulb[:label]} power state.#{bulb.has_key?(:power) ? " It is currently #{bulb[:power]}." : ''}",
                          :arg => "toggle #{id}"
                      })
        end

        # Check whether the user wants to see the color function
        if color
          # Add an item to set the color
          fb.add_item({
                          :title => "Set #{bulb[:label]} to Color#{(ARGV[0] == nil || ARGV[0].strip == '' ? '' : " \"#{ARGV[0]}\"")}",
                          :subtitle => 'Samples for Colors are: "random", "blue", "#ff0000"',
                          :arg => "state #{id} color #{Shellwords.escape(ARGV[0])}",
                          :valid => (ARGV[0] == nil || ARGV[0].strip == '' ? 'no' : 'yes')
                      })
        end

        # Check whether the user wants to see the breathe function
        if breathe
          # Add an item to breathe the color
          fb.add_item({
                          :title => "Breathe #{bulb[:label]} with Color#{(ARGV[0] == nil || ARGV[0].strip == '' ? '' : " \"#{ARGV[0]}\"")}",
                          :subtitle => 'Samples for Colors are: "random", "blue", "#ff0000"',
                          :arg => "breathe #{id} #{Shellwords.escape(ARGV[0])}",
                          :valid => (ARGV[0] == nil || ARGV[0].strip == '' ? 'no' : 'yes')
                      })
        end

        # Check whether the user wants to see the pulse function
        if pulse
          # Add an item to pulse the color
          fb.add_item({
                          :title => "Pulse #{bulb[:label]} with Color#{(ARGV[0] == nil || ARGV[0].strip == '' ? '' : " \"#{ARGV[0]}\"")}",
                          :subtitle => 'Samples for Colors are: "random", "blue", "#ff0000"',
                          :arg => "pulse #{id} #{Shellwords.escape(ARGV[0])}",
                          :valid => (ARGV[0] == nil || ARGV[0].strip == '' ? 'no' : 'yes')
                      })
        end
      }
    
      # Iterate all bulbs
      scenes.each { |id, scene|
        # Add the item to activate scene
        fb.add_item({
                        :title => "Activate Scene \"#{scene[:name]}\"",
                        :subtitle => "Activates the Scene \"#{scene[:name]}\".",
                        :arg => "activate_scene #{id}"
                    })
      }
    end
  else
    # Add the item to set the client token
    fb.add_item({
                    :title => 'Set the Client Token first',
                    :subtitle => 'You have to set the client token first. Press enter to get more information.',
                    :arg => 'more_info'
                })
  end
  puts fb.to_xml(ARGV)
end
