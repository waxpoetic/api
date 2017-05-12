# frozen_string_literal: true

class ArtistsController < ApplicationController
  resource :artist

  api! 'List all artists'
  def index
    respond_with @artists
  end

  api! 'Show a single artist'
  def show
    respond_with @artist
  end

  api! 'Create a new artist'
  def create
    @artist = Artist.create edit_params
    respond_with @artist
  end

  api! 'Update an existing artist'
  def update
    @artist.update edit_params
    respond_with @artist
  end

  api! 'Delete an existing artist'
  def update
    @artist.destroy
    respond_with @artist
  end
end
