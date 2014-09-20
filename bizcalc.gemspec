# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bizsh/version'

Gem::Specification.new do |spec|
  spec.name          = "bizsh"
  spec.version       = Bizsh::VERSION
  spec.authors       = ["Brad Gessler"]
  spec.email         = ["bradgessler@gmail.com"]
  spec.summary       = %q{An interactive ruby shell optimized business calculations.}
  spec.homepage      = "https://github.com/bradgessler/bizsh"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "pry"
  spec.add_runtime_dependency "stock_quote", ">= 1.1.8"
  # I have to include rest-client and mime-types on behalf of the stock_quote gem so
  # that I don't get "WARN: Unresolved specs during Gem::Specification.reset" warnings
  spec.add_runtime_dependency "rest-client", ">= 1.7.2"
  spec.add_runtime_dependency "mime-types", ">= 2.3"
end
