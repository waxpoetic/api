# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require "sprockets/railtie"
require 'active_storage/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mindbrain
  # Web application powering mindbrainmusic.com
  class Application < Rails::Application
    # Cosmetic name of this application
    config.name = 'Wax Poetic Records API'

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Version of the API
    config.api_version = '1.0'

    # All domains that this application serves JS apps for.
    config.domains = config_for(:domains)

    # Default to local file storage service.
    config.active_storage.service = :local
  end
end
