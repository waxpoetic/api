# frozen_string_literal: true

# API control.
class ApplicationController < ActionController::API
  include ControllerResources
  include Halt
  include ActionController::MimeResponds

  PROTECTED_ACTIONS = %i(create update destroy).freeze

  halt ActiveRecord::RecordNotFound, with: :not_found
  halt Pundit::Error, with: :unauthorized
  halt User::AuthenticationError, with: :forbidden

  attr_accessor :current_user

  before_action :authenticate_user!, only: PROTECTED_ACTIONS

  protected

  def logged_in?
    current_user.present?
  end

  def authenticate_user!
    authenticate_or_request_with_http_token do |token, options|
      self.current_user = User.authenticate! token: token, **options
    end
  end
end
