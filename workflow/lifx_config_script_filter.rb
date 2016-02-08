#!/usr/bin/env ruby
# encoding: utf-8


require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require './helper'
require './constants'

require_relative 'bundle/bundler/setup'
require 'alfred'

Alfred.with_friendly_error do |alfred|
  # Create the feedback
  fb = alfred.feedback

  all_bulbs = get_preference(alfred, CONFIG_SHOW_ALL_KEY, 'yes') == 'yes'
  individual_bulbs = get_preference(alfred, CONFIG_SHOW_INDIVIDUAL_KEY, 'yes') == 'yes'
  show_scenes = get_preference(alfred, CONFIG_SHOW_SCENES_KEY, 'yes') == 'yes'
  power_off = get_preference(alfred, CONFIG_SHOW_POWER_OFF_KEY, 'yes') == 'yes'
  power_on = get_preference(alfred, CONFIG_SHOW_POWER_ON_KEY, 'yes') == 'yes'
  toggle = get_preference(alfred, CONFIG_SHOW_TOGGLE_KEY, 'yes') == 'yes'
  breathe = get_preference(alfred, CONFIG_SHOW_BREATHE_KEY, 'yes') == 'yes'
  pulse = get_preference(alfred, CONFIG_SHOW_PULSE_KEY, 'yes') == 'yes'
  color = get_preference(alfred, CONFIG_SHOW_COLOR_KEY, 'yes') == 'yes'
  refresh = get_preference(alfred, CONFIG_SHOW_REFRESH_KEY, 'yes') == 'yes'

  # Add the item to add the client token
  fb.add_item({
                  :title => 'Set Client Token' + (ARGV[0] == nil || ARGV[0].strip == '' ? '' : " \"#{ARGV[0]}\""),
                  :subtitle => 'Set the client token to be able to access the LIFX API.' +
                      (get_preference(alfred, 'client_token') != '' ?
                          " Current client token: #{get_preference(alfred, 'client_token')}" : ''),
                  :arg => "client_token #{ARGV[0]}",
                  :valid => (ARGV[0] == nil || ARGV[0].strip == '' ? 'no' : 'yes'),
                  :icon => {:type => 'default', :name => ICON_GEAR}
              })

  # Add an item for all bulbs
  fb.add_item({
                  :title => "#{all_bulbs ? 'Hide' : 'Show'} \"all Bulbs\" entries",
                  :subtitle => "#{all_bulbs ? 'Hide' : 'Show'} \"all Bulbs\" entries in general.",
                  :arg => CONFIG_SHOW_ALL_KEY,
                  :icon => {:type => 'default', :name => ICON_GEAR}
              })

  # Add an item for individual bulbs
  fb.add_item({
                  :title => "#{individual_bulbs ? 'Hide' : 'Show'} individual Bulb entries",
                  :subtitle => "#{individual_bulbs ? 'Hide' : 'Show'} individual Bulb entries in general.",
                  :arg => CONFIG_SHOW_INDIVIDUAL_KEY,
                  :icon => {:type => 'default', :name => ICON_GEAR}
              })
              
  # Add an item for scenes
  fb.add_item({
              :title => "#{show_scenes ? 'Hide' : 'Show'} Scenes",
              :subtitle => "#{show_scenes ? 'Hide' : 'Show'} Scenes in general.",
              :arg => CONFIG_SHOW_SCENES_KEY,
              :icon => {:type => 'default', :name => ICON_GEAR}
              })

  # Add an item to power the bulb on
  fb.add_item({
                  :title => "#{power_on ? 'Hide' : 'Show'} Power On",
                  :subtitle => "#{power_on ? 'Hide' : 'Show'} the Power On function.",
                  :arg => CONFIG_SHOW_POWER_ON_KEY,
                  :icon => {:type => 'default', :name => ICON_GEAR}
              })

  # Add an item to power the bulb off
  fb.add_item({
                  :title => "#{power_off ? 'Hide' : 'Show'} Power Off",
                  :subtitle => "#{power_off ? 'Hide' : 'Show'} the Power Off function.",
                  :arg => CONFIG_SHOW_POWER_OFF_KEY,
                  :icon => {:type => 'default', :name => ICON_GEAR}
              })

  # Add an item to toggle the bulbs power state
  fb.add_item({
                  :title => "#{toggle ? 'Hide' : 'Show'} Toggle",
                  :subtitle => "#{toggle ? 'Hide' : 'Show'} the Toggle function.",
                  :arg => CONFIG_SHOW_TOGGLE_KEY,
                  :icon => {:type => 'default', :name => ICON_GEAR}
              })

  # Add an item to breathe
  fb.add_item({
                  :title => "#{breathe ? 'Hide' : 'Show'} Breathe",
                  :subtitle => "#{breathe ? 'Hide' : 'Show'} the Breathe function.",
                  :arg => CONFIG_SHOW_BREATHE_KEY,
                  :icon => {:type => 'default', :name => ICON_GEAR}
              })

  # Add an item to pulse
  fb.add_item({
                  :title => "#{pulse ? 'Hide' : 'Show'} Pulse",
                  :subtitle => "#{pulse ? 'Hide' : 'Show'} the Pulse function.",
                  :arg => CONFIG_SHOW_PULSE_KEY,
                  :icon => {:type => 'default', :name => ICON_GEAR}
              })

  # Add an item to set color
  fb.add_item({
                  :title => "#{color ? 'Hide' : 'Show'} Color",
                  :subtitle => "#{color ? 'Hide' : 'Show'} the Color function.",
                  :arg => CONFIG_SHOW_COLOR_KEY,
                  :icon => {:type => 'default', :name => ICON_GEAR}
              })

  # Add an item to refresh bulbs
  fb.add_item({
                  :title => "#{refresh ? 'Hide' : 'Show'} Refresh Bulbs",
                  :subtitle => "#{refresh ? 'Hide' : 'Show'} the Refresh Bulbs function.",
                  :arg => CONFIG_SHOW_REFRESH_KEY,
                  :icon => {:type => 'default', :name => ICON_GEAR}
              })

  # Add an item to get more information
  fb.add_item({
                  :title => 'More Information',
                  :subtitle => 'Press enter to find out more about this workflow.',
                  :arg => 'more_info',
                  :icon => {:type => 'default', :name => ICON_GEAR}
              })

  puts fb.to_xml(ARGV)

end

