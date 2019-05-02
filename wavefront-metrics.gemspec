# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wavefront/metrics/version'

Gem::Specification.new do |spec|
  spec.name          = 'wavefront-metrics'
  spec.version       = Wavefront::Metrics::VERSION
  spec.authors       = ['Yogesh Prasad Kurmi']
  spec.email         = ['chitimba@wavefront.com']

  spec.summary       = 'Wavefront Ruby Metrics SDK'
  spec.description   = 'Captures application-level metrics (counters, gauges & histograms) for your ruby code'
  spec.homepage      = 'https://github.com/wavefrontHQ/wavefront-ruby-metrics'
  spec.license       = 'Apache-2.0'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(tests|spec|features)/}) }

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'tdigest', '~> 0.1.1'
  spec.add_dependency 'concurrent-ruby', '~> 1.1', '>= 1.1.5'
  spec.add_dependency 'wavefront-client'

  spec.add_development_dependency 'test-unit', '~> 3.3'
  spec.add_development_dependency 'bundler', '~> 2.0'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')
end
