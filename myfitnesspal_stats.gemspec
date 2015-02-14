# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'myfitnesspal_stats/version'

Gem::Specification.new do |spec|
  spec.name          = "myfitnesspal_stats"
  spec.version       = MyfitnesspalStats::VERSION
  spec.authors       = ["Hunter Ducharme"]
  spec.email         = ["hgducharme@gmail.com"]
  spec.summary       = %q{Programatically access your daily nutrition from myfitnesspal.}
  spec.description   = %q{A module that replace Myfitnesspal's API. Get access to all of your stats & attributes for nutrition and weight progression.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "mechanize", "~> 2.7"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "webmock", "~> 1.20"
  spec.add_development_dependency "vcr", "~> 2.9"
end
