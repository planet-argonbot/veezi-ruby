# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'veezi/version'

Gem::Specification.new do |spec|
  spec.name          = "veezi-ruby"
  spec.version       = Veezi::VERSION
  spec.authors       = ["Carlos Rodriguez"]
  spec.email         = ["carlos@eddorre.com"]
  spec.description   = %q{Ruby Gem to consume Veezi API}
  spec.summary       = %q{Ruby Gem to consume Veezi API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.6"
  spec.add_dependency "crack", "~> 0.4"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "webmock", "~> 1.15"
end
