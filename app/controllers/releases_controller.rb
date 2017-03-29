# frozen_string_literal: true

class ReleasesController < ApplicationController
  resource :release

  def index
    respond_with @releases
  end

  def show
    render @release
  end
end
