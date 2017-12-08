# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'telegram/bot/response_builder'

Gem::Specification.new do |spec|
  spec.name          = 'telegram-bot-response_builder'
  spec.version       = Telegram::Bot::ResponseBuilder::VERSION
  spec.authors       = ['Sergei Maximov']
  spec.email         = ['s.b.maximov@gmail.com']

  spec.summary       = 'Response builder for the telegram-bot-ruby gem'
  spec.description   = <<-DESCRIPTION
    An extention to the telegram-bot-ruby gem that enables responding to Telegram
    webhook requests directly in the response body.
  DESCRIPTION
  spec.homepage      = 'https://github.com/smaximov/telegram-bot-response_builder'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3.0'

  spec.add_dependency 'telegram-bot-ruby'

  spec.metadata['yard.run'] = 'yri'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'pry', '~> 0.11.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.51.0'
  spec.add_development_dependency 'yard', '~> 0.9.12'
end
