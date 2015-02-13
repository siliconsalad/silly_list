# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'silly_list/version'

Gem::Specification.new do |spec|
  spec.name          = 'silly_list'
  spec.version       = SillyList::VERSION
  spec.authors       = ['SiliconSalad Tech Team']
  spec.email         = ['tech@siliconsalad.com']
  spec.summary       = 'Array like classes. Add Stack behavior, Queue is coming.'
  spec.homepage      = 'https://github.com/siliconsalad/silly_list'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.2.0'
  spec.add_development_dependency 'yard'
end
