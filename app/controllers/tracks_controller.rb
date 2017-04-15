# frozen_string_literal: true

class TracksController < ApplicationController
  resource :track

  api :GET, 'releases', 'List all releases by all artists'
  def index
    render json: @tracks
  end

  api :GET, 'releases/:id', 'Show a single release details'
  param :id, :number, required: true
  def show
    render json: @track
  end
end
