# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'signed_parameters/version'

Gem::Specification.new do |spec|
  spec.name          = "signed_parameters"
  spec.version       = SignedParameters::VERSION
  spec.authors       = ["Evgeniy Serykh"]
  spec.email         = ["e.v.serykh@gmail.com"]
  spec.summary       = %q{Signed parameters}
  spec.description   = %q{Signed parameters}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', '>= 2.2.1'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
