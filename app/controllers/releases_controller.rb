class ReleasesController < ApplicationController
  resource :release

  def index
    respond_with @releases
  end

  def show
    respond_with @release
  end
end
