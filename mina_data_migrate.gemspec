# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/data_migrate/version'

Gem::Specification.new do |spec|
  spec.name          = "mina-data-migrate"
  spec.version       = Mina::DataMigrate::VERSION
  spec.authors       = ["Vladimir Elchinov"]
  spec.email         = ["elik@elik.ru"]
  spec.description   = %q{Adds data migrations support to Mina}
  spec.summary       = %q{Adds data migrations support to Mina}
  spec.homepage      = "https://github.com/railsblueprint/mina-data-migrate/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mina", "~> 1.0"
  spec.add_development_dependency "bundler", ">= 1.3.5"
  spec.add_development_dependency "rake"
end
