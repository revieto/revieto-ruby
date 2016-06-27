# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'revieto/version'

Gem::Specification.new do |spec|
  spec.name          = 'revieto'
  spec.version       = Revieto::VERSION
  spec.authors       = ['Bruno Valentino']
  spec.email         = ['brunovalentino@gmail.com']

  spec.summary       = %q{Ruby bindings for the Revieto API (https://wwww.revieto.com)}
  spec.description   = %q{Ruby bindings for the Revieto API (https://wwww.revieto.com)}
  spec.homepage      = 'https://github.com/revieto/revieto-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'forgery'
  spec.add_development_dependency 'coveralls'
  spec.add_dependency 'http'
end
