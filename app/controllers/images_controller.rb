class ImagesController < ApplicationController
  def index
    @images = current_artist.images
    respond_with @images
  end
end
