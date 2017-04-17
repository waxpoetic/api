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
end
