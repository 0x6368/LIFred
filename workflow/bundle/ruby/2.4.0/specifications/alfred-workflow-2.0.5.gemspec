# -*- encoding: utf-8 -*-
# stub: alfred-workflow 2.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "alfred-workflow".freeze
  s.version = "2.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Zhao Cai".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDdDCCAlygAwIBAgIBATANBgkqhkiG9w0BAQUFADBAMRIwEAYDVQQDDAljYWl6\naGFvZmYxFTATBgoJkiaJk/IsZAEZFgVnbWFpbDETMBEGCgmSJomT8ixkARkWA2Nv\nbTAeFw0xMzA0MTYxMzAxMzlaFw0xNDA0MTYxMzAxMzlaMEAxEjAQBgNVBAMMCWNh\naXpoYW9mZjEVMBMGCgmSJomT8ixkARkWBWdtYWlsMRMwEQYKCZImiZPyLGQBGRYD\nY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAu2zqh0u+TbhY5kNf\nZ4OI5AZnXyIE6xVjO7mpp5t5qS+6m8iPIwWYhVTzFm/TDHX1jJ1Dauy7/iXA5m+i\nxAKAOmCiL2j1VudVz+qBKPwiPAG3O0gtLWsxX5J5BwMimakOmDTGmXAEJCCYNjs8\n9hdJzcGLydTpQU3RuAn2RE+Y7Rzwm3RAW/hMs5PDdx/3XtksHlQ54is4zob0aCOs\nhJ9TYLpaKvtZCixX0YyiIuAl07BI4sYyXNNWzk+tHf5RlJ3d/oXR/XxLI6xH2v+h\nRMsQVqF9UKGANhc8yhrcL7YnG6G8v8fkdJFKa2ZuBSIqYKCLl4ATcXD6tTF+THTf\noVxAGQIDAQABo3kwdzAJBgNVHRMEAjAAMB0GA1UdDgQWBBSCk5kEqlkwgrdYCHRk\nwy0ZQt1eeTAeBgNVHREEFzAVgRNjYWl6aGFvZmZAZ21haWwuY29tMAsGA1UdDwQE\nAwIEsDAeBgNVHRIEFzAVgRNjYWl6aGFvZmZAZ21haWwuY29tMA0GCSqGSIb3DQEB\nBQUAA4IBAQCle3HlwCgKX19WNYY2EcJYilQCZJPtl/Gj1EbefaX3paMym6yO4FB9\ni2yP1WTVB4N8OrS0z24b6mo5jKgplyTU6w9D+yI5WKbN4C7XCbBLeNGVlD9yK8CA\nzc+igDfc63grzUR5Xj7PPxef4owUdz+XDG+mmmv6wNyXSzQUtFyZ8ucVL1vk5ihP\nvZU7EDLfcHe3xiTYkarBtblwtSj6PHtYn/1v8ztYHhGKvW3wTTiplNwnW4Sx2Wfa\neIuFwYbmfyt5/ObUtmp3BlaIStTiX9TBWeuTx6Zq6q6wDzcudbDRd+jLa2XG2AGB\nS6w/KYMnbhUxfyEU1MX10sJv87WIrtgF\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2013-10-24"
  s.description = "alfred-workflow is a ruby Gem helper for building [Alfred](http://www.alfredapp.com) workflow.".freeze
  s.email = ["caizhaoff@gmail.com".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "Manifest.txt".freeze, "README.md".freeze]
  s.files = ["History.txt".freeze, "Manifest.txt".freeze, "README.md".freeze]
  s.homepage = "http://zhaocai.github.com/alfred2-ruby-template/".freeze
  s.licenses = ["GPL-3".freeze]
  s.rdoc_options = ["--title".freeze, "TestAlfred::TestWorkflow Documentation".freeze, "--quiet".freeze]
  s.rubyforge_project = "alfred-workflow".freeze
  s.rubygems_version = "2.6.14".freeze
  s.summary = "alfred-workflow is a ruby Gem helper for building [Alfred](http://www.alfredapp.com) workflow.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<plist>.freeze, [">= 3.1.0"])
      s.add_runtime_dependency(%q<moneta>.freeze, [">= 0.7.19"])
      s.add_runtime_dependency(%q<gyoku>.freeze, [">= 1.1.0"])
      s.add_runtime_dependency(%q<nori>.freeze, [">= 2.3.0"])
      s.add_runtime_dependency(%q<fuzzy_match>.freeze, [">= 2.0.4"])
      s.add_runtime_dependency(%q<terminal-notifier>.freeze, [">= 1.5.0"])
      s.add_development_dependency(%q<hoe-yard>.freeze, [">= 0.1.2"])
      s.add_development_dependency(%q<awesome_print>.freeze, [">= 1.2.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.13"])
      s.add_development_dependency(%q<facets>.freeze, [">= 2.9.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 10.0.0"])
      s.add_development_dependency(%q<hoe>.freeze, [">= 0"])
      s.add_development_dependency(%q<hoe-gemspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<hoe-git>.freeze, [">= 0"])
      s.add_development_dependency(%q<hoe-version>.freeze, [">= 0"])
      s.add_development_dependency(%q<hoe-travis>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<terminal-notifier-guard>.freeze, [">= 0"])
      s.add_development_dependency(%q<growl>.freeze, [">= 0"])
    else
      s.add_dependency(%q<plist>.freeze, [">= 3.1.0"])
      s.add_dependency(%q<moneta>.freeze, [">= 0.7.19"])
      s.add_dependency(%q<gyoku>.freeze, [">= 1.1.0"])
      s.add_dependency(%q<nori>.freeze, [">= 2.3.0"])
      s.add_dependency(%q<fuzzy_match>.freeze, [">= 2.0.4"])
      s.add_dependency(%q<terminal-notifier>.freeze, [">= 1.5.0"])
      s.add_dependency(%q<hoe-yard>.freeze, [">= 0.1.2"])
      s.add_dependency(%q<awesome_print>.freeze, [">= 1.2.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.13"])
      s.add_dependency(%q<facets>.freeze, [">= 2.9.0"])
      s.add_dependency(%q<rake>.freeze, [">= 10.0.0"])
      s.add_dependency(%q<hoe>.freeze, [">= 0"])
      s.add_dependency(%q<hoe-gemspec>.freeze, [">= 0"])
      s.add_dependency(%q<hoe-git>.freeze, [">= 0"])
      s.add_dependency(%q<hoe-version>.freeze, [">= 0"])
      s.add_dependency(%q<hoe-travis>.freeze, [">= 0"])
      s.add_dependency(%q<guard>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_dependency(%q<guard-bundler>.freeze, [">= 0"])
      s.add_dependency(%q<terminal-notifier-guard>.freeze, [">= 0"])
      s.add_dependency(%q<growl>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<plist>.freeze, [">= 3.1.0"])
    s.add_dependency(%q<moneta>.freeze, [">= 0.7.19"])
    s.add_dependency(%q<gyoku>.freeze, [">= 1.1.0"])
    s.add_dependency(%q<nori>.freeze, [">= 2.3.0"])
    s.add_dependency(%q<fuzzy_match>.freeze, [">= 2.0.4"])
    s.add_dependency(%q<terminal-notifier>.freeze, [">= 1.5.0"])
    s.add_dependency(%q<hoe-yard>.freeze, [">= 0.1.2"])
    s.add_dependency(%q<awesome_print>.freeze, [">= 1.2.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.13"])
    s.add_dependency(%q<facets>.freeze, [">= 2.9.0"])
    s.add_dependency(%q<rake>.freeze, [">= 10.0.0"])
    s.add_dependency(%q<hoe>.freeze, [">= 0"])
    s.add_dependency(%q<hoe-gemspec>.freeze, [">= 0"])
    s.add_dependency(%q<hoe-git>.freeze, [">= 0"])
    s.add_dependency(%q<hoe-version>.freeze, [">= 0"])
    s.add_dependency(%q<hoe-travis>.freeze, [">= 0"])
    s.add_dependency(%q<guard>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<guard-bundler>.freeze, [">= 0"])
    s.add_dependency(%q<terminal-notifier-guard>.freeze, [">= 0"])
    s.add_dependency(%q<growl>.freeze, [">= 0"])
  end
end
