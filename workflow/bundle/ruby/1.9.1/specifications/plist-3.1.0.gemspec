# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "plist"
  s.version = "3.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Bleything and Patrick May"]
  s.autorequire = "plist"
  s.date = "2010-02-23"
  s.description = "Plist is a library to manipulate Property List files, also known as plists.  It can parse plist files into native Ruby data structures as well as generating new plist files from your Ruby objects.\n"
  s.homepage = "http://plist.rubyforge.org"
  s.require_paths = ["lib"]
  s.rubyforge_project = "plist"
  s.rubygems_version = "1.8.23.2"
  s.summary = "All-purpose Property List manipulation library."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
