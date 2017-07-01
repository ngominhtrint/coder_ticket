# -*- encoding: utf-8 -*-
# stub: font-kit-rails 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "font-kit-rails"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Tobias Sandelius"]
  s.date = "2015-07-23"
  s.description = ""
  s.email = ["tobias@sandeli.us"]
  s.homepage = "https://github.com/sandelius/font-kit-rails"
  s.rubygems_version = "2.5.1"
  s.summary = "Font Kit Rails - Awesome font kit for your rails app."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 0"])
  end
end
