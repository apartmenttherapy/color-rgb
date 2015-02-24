# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'color/version'

Gem::Specification.new do |spec|
  spec.name          = "color"
  spec.version       = Color::VERSION
  spec.authors       = ["ramin keene"]
  spec.email         = ["raminkeene@gmail.com"]
  spec.summary       = %q{RGB color conversion and color distance}
  spec.description   = %q{RGB color conversion and color distance}
  spec.homepage      = "http://github.com/apartmenttherapy/color"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "rspec"
end
