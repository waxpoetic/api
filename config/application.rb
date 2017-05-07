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
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Waxpoetic
  # Web application powering waxpoeticrecords.com
  class Application < Rails::Application
    config.name = 'Wax Poetic Records API'
    config.version = '0.0.1'

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.api_version = '1.0'

    # Configure the CDN domain used by uploaded files.
    config.cdn_domain_name = "https://files.#{secrets.domain_name}"

    # A list of allowed origin sites that can access the API data in
    # their web applications.
    config.sites = %w(
      https://*.waxpoeticrecords.com
      https://thewonderbars.com
      https://rndnbass.com
    )
  end
end
