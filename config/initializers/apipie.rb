Apipie.configure do |config|
  config.app_name                = 'Wax Poetic Records API'
  config.api_base_url            = '/'
  config.doc_base_url            = '/docs'
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.copyright = '&copy; 2017 Wax Poetic Records, LLC'
  config.markup = Apipie::Markup::Markdown.new
  config.app_info = File.read Rails.root.join('docs', 'api.md')
end
