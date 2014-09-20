# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bizsh/version'

Gem::Specification.new do |spec|
  spec.name          = "bizsh"
  spec.version       = Bizsh::VERSION
  spec.authors       = ["Brad Gessler"]
  spec.email         = ["bradgessler@gmail.com"]
  spec.summary       = %q{A shell for quickly running business calculations.}
  spec.homepage      = "https://github.com/bradgessler/bizsh"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "pry"
  spec.add_dependency "activesupport"
end
