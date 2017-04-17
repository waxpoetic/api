# frozen_string_literal: true

class ReleasesController < ApplicationController
  resource :release

  api! 'List all releases'
  def index
    respond_with @releases
  end

  api! 'Show a single release details'
  def show
    respond_with @release
  end
end
