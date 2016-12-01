# API control.
class ApplicationController < ActionController::API
  include ControllerResources
  include Halt
  include Pundit
  include Responders

  responders :flash, :http_cache
  respond_to :json

  after_action :verify_authorized
  after_action :verify_policy_scoped
  after_action :populate_headers

  private

  def populate_headers
    response.headers['X-Flash'] = flash.to_json
  end
end
