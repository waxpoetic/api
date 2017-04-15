# frozen_string_literal: true

class ReleasesController < ApplicationController
  resource :release

  api :GET, 'releases', 'List all releases by all artists'
  def index
    respond_with @releases
  end

  api :GET, 'releases/:id', 'Show a single release details'
  param :id, :number, required: true
  def show
    respond_with @release
  end
end
