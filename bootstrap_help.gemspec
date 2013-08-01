# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bootstrap_help/version'

Gem::Specification.new do |spec|
  spec.name          = "bootstrap_help"
  spec.version       = BootstrapHelp::VERSION
  spec.authors       = ["Josh Klina"]
  spec.email         = ["joshua.klina@gmail.com"]
  spec.description   = %q{Helper methods for generating Twitter Bootstrap markup}
  spec.summary       = %q{Twitter Bootstrap makeup generators}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency('log4r', '>= 1.0.5')
  spec.add_dependency('rails', '~> 4.0')
end
