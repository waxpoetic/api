class TracksController < ApplicationController
  resource :track

  def index
    render json: @tracks
  end

  def show
    render json: @track
  end
end
