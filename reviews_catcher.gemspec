# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reviews_catcher/version'

Gem::Specification.new do |spec|
  spec.name          = 'reviews_catcher'
  spec.version       = ReviewsCatcher::VERSION
  spec.authors       = ['Bruno Valentino']
  spec.email         = ['brunovalentino@gmail.com']

  spec.summary       = %q{Ruby bindings for the reviewscatcher.io API}
  spec.description   = %q{Ruby bindings for the reviewscatcher.io API}
  spec.homepage      = 'https://github.com/bvalentino/reviewscatcher-ruby'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://www.reviewscatcher.io'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

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
end
