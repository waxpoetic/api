class ReleasesController < ApplicationController
  resource :release

  def index
    render json: @release
  end

  def show
    render json: @release
  end
end
