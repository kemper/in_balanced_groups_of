# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'in_balanced_groups_of/version'

Gem::Specification.new do |spec|
  spec.name          = "in_balanced_groups_of"
  spec.version       = InBalancedGroupsOf::VERSION
  spec.authors       = ["Kris Kemper"]
  spec.email         = ["kriskemper@gmail.com"]
  spec.summary       = %q{An in order, balanced in_groups_of implementation}
  spec.description   = %q{An in order, balanced in_groups_of implementation}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "pry"
end
