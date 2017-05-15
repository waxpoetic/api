# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers'
gem 'controller_resources'
gem 'dragonfly'
gem 'ember-cli-rails'
gem 'halt'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'pundit'
gem 'rack-cors'
gem 'rails', '~> 5.1'
gem 'redis', '~> 3.0'
gem 'responders'
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
gem 'bcrypt'
gem 'apipie-rails'
gem 'maruku'
gem 'administrate', github: 'tiagoamaro/administrate', branch: 'allow-rails-5-1'

group :development, :test do
  gem 'pry-byebug', platform: :mri
  gem 'pry-rails', platform: :mri
end

group :development do
  gem 'annotate'
  gem 'listen', '~> 3.0.5'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'redis-rack-cache'
  gem 'redis-rails'
  gem 'sidekiq'
  gem 'dragonfly-s3_data_store'
  gem 'newrelic_rpm'
end
