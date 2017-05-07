class ImagesController < ApplicationController
  resource :image, ancestor: :current_artist

  def index
    respond_with @images
  end
end
