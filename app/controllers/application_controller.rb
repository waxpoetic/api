# frozen_string_literal: true

# API control.
class ApplicationController < ActionController::API
  include ControllerResources
  include Halt
  include ActionController::MimeResponds

  PROTECTED_ACTIONS = %i(create update destroy).freeze

  halt ActiveRecord::RecordNotFound, with: :not_found
  halt Pundit::Error, with: :unauthorized
  halt LoginError, with: :forbidden

  attr_accessor :current_user

  before_action :authenticate_user!, only: PROTECTED_ACTIONS

  respond_to :json

  protected

  def authenticate_user!
    authenticate_or_request_with_http_token app_name do |token, options|
      login = Login.new token: token, email: options['email']
      raise LoginError unless login.valid?
      self.current_user = login.user
    end

    render status: :unauthorized and return unless current_user.present?
  end

  def current_artist
    @current_artist ||= Artist.find! current_artist_id
  end

  def collection
    return super unless current_artist.present?
    current_artist.public_send collection_name
  end

  def current_artist_id
    params[:artist_id] || request.headers['Artist']
  end

  def app_name
    Rails.application.config.name
  end
end
