#!/usr/bin/env ruby
# encoding: utf-8


require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require './helper'
require './constants'

require_relative 'bundle/bundler/setup'
require 'alfred'
require 'json'
require 'curb'
require 'launchy'

Alfred.with_friendly_error do |alfred|
  # Get the action
  action = ARGV[0]
  
  # Check whether the user wants to refresh the bulbs
  if action == 'refresh'
    puts `./lifx_run_script.rb refresh`
    
  # Check whether the action is valid
  elsif [CONFIG_SHOW_ALL_KEY, CONFIG_SHOW_INDIVIDUAL_KEY, CONFIG_SHOW_POWER_OFF_KEY, CONFIG_SHOW_POWER_ON_KEY,
  CONFIG_SHOW_TOGGLE_KEY, CONFIG_SHOW_COLOR_KEY, CONFIG_SHOW_BREATHE_KEY, CONFIG_SHOW_PULSE_KEY, CONFIG_SHOW_SCENES_KEY].include? action
    # Toggle the preference
    toggle_preference(alfred, action)
  elsif action == 'client_token'
    # Check whether there is client token
    if ARGV[1]
      # Set the client token
      set_preference(alfred, 'client_token', ARGV[1].strip)

      # Add the notification
      puts 'Client token successfully set.'

      # Refresh the bulbs
      puts `/usr/bin/ruby ./lifx_run_script.rb refresh`
    else
      # Add the notification
      puts 'Please enter a valid client token.'
    end
  elsif action == 'more_info'
    # Open the website
    Launchy.open(MORE_INFO_WEBSITE)
  else
    puts 'Invalid action: ' + action
  end
end
