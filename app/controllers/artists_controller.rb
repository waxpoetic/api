# frozen_string_literal: true

class ArtistsController < ApplicationController
  resource :artist

  api :GET, 'artists', 'List all artists'
  def index
    respond_with @artists
  end

  api :GET, 'artists/:id', 'Show a single artist'
  param :id, :number, required: true
  def show
    respond_with @artist
  end
end
