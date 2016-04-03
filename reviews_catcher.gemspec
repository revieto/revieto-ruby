# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reviews_catcher/version'

Gem::Specification.new do |spec|
  spec.name          = 'reviews_catcher'
  spec.version       = ReviewsCatcher::VERSION
  spec.authors       = ['Bruno Valentino']
  spec.email         = ['brunovalentino@gmail.com']

  spec.summary       = %q{Ruby bindings for the ReviewsCatcher API (http://wwww.reviewscatcher.io)}
  spec.description   = %q{Ruby bindings for the ReviewsCatcher API (http://wwww.reviewscatcher.io)}
  spec.homepage      = 'https://github.com/reviewscatcher/reviewscatcher-ruby'
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
end
