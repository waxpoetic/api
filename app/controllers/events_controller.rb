class EventsController < ApplicationController
  resource :events, ancestor: :current_artist

  def index
    respond_with @events
  end
end
