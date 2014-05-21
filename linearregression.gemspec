# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'linearregression/version'

Gem::Specification.new do |spec|
  spec.name          = "linearregression"
  spec.version       = Linearregression::VERSION
  spec.authors       = ["john"]
  spec.email         = ["jhelio.jkd@gmail.com"]
  spec.description   = %q{Simple Ruby Linear Regression}
  spec.summary       = %q{Simple Ruby Linear Regression}
  spec.homepage      = "https://github.com/joaohelio"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
