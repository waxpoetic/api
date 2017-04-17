# frozen_string_literal: true

class TracksController < ApplicationController
  resource :track

  api! 'List all releases by all artists'
  def index
    render json: @tracks
  end

  api! 'Show a single release details'
  def show
    render json: @track
  end
end
