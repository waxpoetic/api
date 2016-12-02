require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret Rails.application.secrets.dragonfly_secret_key_base

  url_format '/media/:job/:name'

  if Rails.application.secrets.s3.present?
    datastore :s3, Rails.application.secrets.s3.symbolize_keys
  else
    upload_path = Rails.root.join('public/system/dragonfly', Rails.env)
    public_path = Rails.root.join('public')
    datastore :file, root_path: upload_path, server_root: public_path
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware
