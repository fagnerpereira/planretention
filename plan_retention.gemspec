# frozen_string_literal: true

require_relative 'lib/plan_retention/version'

Gem::Specification.new do |spec|
  spec.name          = 'plan_retention'
  spec.version       = PlanRetention::VERSION
  spec.authors       = ['Fagner Pereira Rosa']
  spec.email         = ['fagnerfpr@gmail.com']

  spec.summary       = 'Blá'
  spec.description   = 'Given a snapshot, get status as deleted or retained'
  spec.homepage      = 'https://github.com/fagnerpereira/planretention'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.add_development_dependency('rubocop')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
