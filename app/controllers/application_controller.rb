# API control.
class ApplicationController < ActionController::API
  include ControllerResources
  # include Halt
  include Pundit

  PROTECTED_ACTIONS = %i(create update destroy).freeze

  # halt ActiveRecord::RecordNotFound, with: :not_found
  # halt Pundit::Error, with: :unauthorized
  # halt User::AuthenticationError, with: :forbidden

  attr_accessor :current_user

  before_action :authenticate_user!, only: PROTECTED_ACTIONS

  after_action :verify_authorized, except: collection_actions
  after_action :verify_policy_scoped, only: collection_actions

  # Default route of the API, renders JSON information on its version.
  def index
    render json: {
      name: 'Wax Poetic API',
      version: Waxpoetic.version.to_s
    }
  end

  protected

  def logged_in?
    current_user.present?
  end

  def authenticate_user!
    authenticate_or_request_with_http_token do |token, options|
      self.current_user = User.authenticate! token: token, **options
    end
  end

  def model
    super.tap do |record|
      authorize record
    end
  end

  def collection
    super.tap do |records|
      policy_scope records
    end
  end
end
