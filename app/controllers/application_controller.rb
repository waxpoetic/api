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
    authenticate_or_request_with_http_token do |token, options|
      login = Login.new token: token, email: options['email']
      raise LoginError unless login.valid?
      self.current_user = login.user
    end
  end

  def current_artist
    @current_artist ||= Artist.find params[:artist_id]
  rescue ActiveRecord::RecordNotFound
  end

  def collection
    return super unless current_artist.present?
    current_artist.public_send collection_name
  end
end
