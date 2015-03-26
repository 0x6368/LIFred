# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "fuzzy_match"
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Seamus Abshere"]
  s.date = "2014-07-14"
  s.description = "Find a needle in a haystack using string similarity and (optionally) regexp rules. Replaces loose_tight_dictionary."
  s.email = ["seamus@abshere.net"]
  s.executables = ["fuzzy_match"]
  s.files = ["bin/fuzzy_match"]
  s.homepage = "https://github.com/seamusabshere/fuzzy_match"
  s.require_paths = ["lib"]
  s.rubyforge_project = "fuzzy_match"
  s.rubygems_version = "2.0.14"
  s.summary = "Find a needle in a haystack using string similarity and (optionally) regexp rules. Replaces loose_tight_dictionary."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<active_record_inline_schema>, [">= 0.4.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<rspec-core>, [">= 0"])
      s.add_development_dependency(%q<rspec-expectations>, [">= 0"])
      s.add_development_dependency(%q<rspec-mocks>, [">= 0"])
      s.add_development_dependency(%q<activerecord>, [">= 3"])
      s.add_development_dependency(%q<mysql2>, [">= 0"])
      s.add_development_dependency(%q<cohort_analysis>, [">= 0"])
      s.add_development_dependency(%q<weighted_average>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<amatch>, [">= 0"])
    else
      s.add_dependency(%q<active_record_inline_schema>, [">= 0.4.0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<rspec-core>, [">= 0"])
      s.add_dependency(%q<rspec-expectations>, [">= 0"])
      s.add_dependency(%q<rspec-mocks>, [">= 0"])
      s.add_dependency(%q<activerecord>, [">= 3"])
      s.add_dependency(%q<mysql2>, [">= 0"])
      s.add_dependency(%q<cohort_analysis>, [">= 0"])
      s.add_dependency(%q<weighted_average>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<amatch>, [">= 0"])
    end
  else
    s.add_dependency(%q<active_record_inline_schema>, [">= 0.4.0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<rspec-core>, [">= 0"])
    s.add_dependency(%q<rspec-expectations>, [">= 0"])
    s.add_dependency(%q<rspec-mocks>, [">= 0"])
    s.add_dependency(%q<activerecord>, [">= 3"])
    s.add_dependency(%q<mysql2>, [">= 0"])
    s.add_dependency(%q<cohort_analysis>, [">= 0"])
    s.add_dependency(%q<weighted_average>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<amatch>, [">= 0"])
  end
end
