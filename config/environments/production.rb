# frozen_string_literal: true

Rails.application.configure do
  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = false

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  config.action_controller.asset_host = Rails.configuration.cdn_domain_name

  # Specifies the header that your server uses for sending files.
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Mount Action Cable outside main process or domain
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  config.action_cable.allowed_request_origins = [
    "https://#{Rails.application.secrets.domain_name}"
  ]

  # Force all access to the app over SSL, use Strict-Transport-Security,
  # and use secure cookies.
  config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [:request_id]

  # Use a different cache store in production.
  config.cache_store = :redis_store, 'redis://store:6379/0/rails_cache'
  config.session_store :redis_store, servers: %w(
    redis://store:6379/0/rails_session
  )
  config.action_dispatch.rack_cache = {
    metastore: 'redis://store:6379/1/rack_metastore',
    entitystore: 'redis://store:6379/1/rack_entitystore'
  }

  # Use Sidekiq as a backend for ActiveJob
  config.active_job.queue_adapter     = :sidekiq
  config.active_job.queue_name_prefix = "waxpoetic_#{Rails.env}"
  config.action_mailer.perform_caching = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Log to STDOUT
  logger           = ActiveSupport::Logger.new(STDOUT)
  logger.formatter = config.log_formatter
  config.logger = ActiveSupport::TaggedLogging.new(logger)

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
