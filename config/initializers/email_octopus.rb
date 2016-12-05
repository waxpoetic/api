EmailOctopus.configure do |config|
  config.api_key = Rails.application.secrets.email_octopus_key
end
