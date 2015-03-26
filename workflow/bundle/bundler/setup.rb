require 'rbconfig'
# ruby 1.8.7 doesn't define RUBY_ENGINE
ruby_engine = defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'
ruby_version = RbConfig::CONFIG["ruby_version"]
path = File.expand_path('..', __FILE__)
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/addressable-2.3.7/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/fuzzy_match-2.1.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/builder-3.2.2/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/gyoku-1.2.3/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/moneta-0.8.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/nori-2.4.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/plist-3.1.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/terminal-notifier-1.6.2/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/alfred-workflow-2.0.5/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/curb-0.8.7/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/curb-0.8.7/ext"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/json-1.8.2/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/launchy-2.4.3/lib"
