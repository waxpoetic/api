class SubscribersController < ApplicationController
  before_action :find_artist
  resource :subscriber

  def index
    respond_with @subscribers
  end

  def show
    respond_with @subscriber
  end

  def create
    @subscriber = model_class.create create_params do |subscriber|
      authorize subscriber
    end
    respond_with @subscriber
  end

  def destroy
    @subscriber.destroy
    respond_with @subscriber
  end

  private

  def create_params
    permitted_attributes(Subscriber)
  end

  def find_artist
    @artist = Artist.find! params[:id]
  end

  def model_class
    if @artist.present?
      @artist.subscribers
    else
      Subscriber
    end
  end
end
