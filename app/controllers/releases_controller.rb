class ReleasesController < ApplicationController
  resource :release

  def index
    render @releases
  end

  def show
    render @release
  end
end
