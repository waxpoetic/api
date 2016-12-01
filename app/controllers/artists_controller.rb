class ArtistsController < ApplicationController
  resource :artist

  def index
    render json: @artists
  end

  def show
    render json: @artist
  end
end
