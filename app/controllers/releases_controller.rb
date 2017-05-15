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

  def model
    model_class.find_by catalog_number: params[:id]&.upcase
  end
end
