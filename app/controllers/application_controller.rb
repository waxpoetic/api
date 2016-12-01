# API control.
class ApplicationController < ActionController::API
  include ControllerResources
  include Halt
  include Pundit

  halt ActiveRecord::RecordNotFound, with: :not_found
  halt Pundit::Error, with: :unauthorized
  halt User::AuthenticationError, with: :forbidden

  before_action :authenticate_user!, only: %i(create update destroy)

  after_action :verify_authorized, except: collection_actions
  after_action :verify_policy_scoped, only: collection_actions
  after_action :populate_headers

  protected

  def authenticate_user!
    authenticate_or_request_with_http_token do |token, options|
      User.authenticate! token: token, **options
    end
  end

  private

  def populate_headers
    response.headers['X-Flash'] = flash.to_json
  end
end
