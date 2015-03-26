#!/usr/bin/env ruby
# encoding: utf-8


require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require './helper'
require './constants'

require_relative 'bundle/bundler/setup'
require 'alfred'
require 'json'
require 'open-uri'

Alfred.with_friendly_error do |alfred|
  # Create the feedback
  fb = alfred.feedback

  # set_preference(alfred, 'client_token', '')

  # Check whether the client token is set
  if get_preference(alfred, 'client_token') != ''
    all_bulbs = get_preference(alfred, CONFIG_SHOW_ALL_KEY, 'yes') == 'yes'
    individual_bulbs = get_preference(alfred, CONFIG_SHOW_INDIVIDUAL_KEY, 'yes') == 'yes'
    power_off = get_preference(alfred, CONFIG_SHOW_POWER_OFF_KEY, 'yes') == 'yes'
    power_on = get_preference(alfred, CONFIG_SHOW_POWER_ON_KEY, 'yes') == 'yes'
    toggle = get_preference(alfred, CONFIG_SHOW_TOGGLE_KEY, 'yes') == 'yes'
    breathe = get_preference(alfred, CONFIG_SHOW_BREATHE_KEY, 'yes') == 'yes'
    pulse = get_preference(alfred, CONFIG_SHOW_PULSE_KEY, 'yes') == 'yes'
    color = get_preference(alfred, CONFIG_SHOW_COLOR_KEY, 'yes') == 'yes'
    refresh = get_preference(alfred, CONFIG_SHOW_REFRESH, 'yes') == 'yes'

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

    # Iterate all bulbs
    bulbs.each { |id, bulb|
      # Check whether the user wants to see the power off function
      if power_off
        # Add an item to power the bulb off
        fb.add_item({
                        :title => "Turn #{bulb[:label]} off",
                        :subtitle => "Turns #{bulb[:label]} off.",
                        :arg => "power #{id} state=off off"
                    })
      end

      # Check whether the user wants to see the power on function
      if power_on
        # Add an item to power the bulb on
        fb.add_item({
                        :title => "Turn #{bulb[:label]} on",
                        :subtitle => "Turns #{bulb[:label]} on.",
                        :arg => "power #{id} state=on on"
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
                        :subtitle => 'Samples for colors are: "random", "blue", "#ff0000"',
                        :arg => "color #{id} color=#{URI::encode(ARGV[0])} #{ARGV[0]}",
                        :valid => (ARGV[0] == nil || ARGV[0].strip == '' ? 'no' : 'yes')
                    })
      end

      # Check whether the user wants to see the breathe function
      if breathe
        # Add an item to breathe the color
        fb.add_item({
                        :title => "Breathe #{bulb[:label]} with Color#{(ARGV[0] == nil || ARGV[0].strip == '' ? '' : " \"#{ARGV[0]}\"")}",
                        :subtitle => 'Samples for colors are: "random", "blue", "#ff0000"',
                        :arg => "breathe #{id} color=#{URI::encode(ARGV[0])} #{ARGV[0]}",
                        :valid => (ARGV[0] == nil || ARGV[0].strip == '' ? 'no' : 'yes')
                    })
      end

      # Check whether the user wants to see the pulse function
      if pulse
        # Add an item to pulse the color
        fb.add_item({
                        :title => "Pulse #{bulb[:label]} with Color#{(ARGV[0] == nil || ARGV[0].strip == '' ? '' : " \"#{ARGV[0]}\"")}",
                        :subtitle => 'Samples for colors are: "random", "blue", "#ff0000"',
                        :arg => "pulse #{id} color=#{URI::encode(ARGV[0])} #{ARGV[0]}",
                        :valid => (ARGV[0] == nil || ARGV[0].strip == '' ? 'no' : 'yes')
                    })
      end
    }

    # Check whether the user wants to see the refresh option
    if refresh
      # Add the item to refresh the bulbs
      fb.add_item({
                      :title => 'Refresh Bulbs',
                      :subtitle => 'Refresh all your bulbs.',
                      :arg => 'refresh'
                  })
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
