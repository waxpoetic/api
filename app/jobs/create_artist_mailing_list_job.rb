class CreateArtistMailingListJob < ApplicationJob
  queue_as :default

  def perform(artist)
    list = List.create name: artist.name
    artist.update list_id: list.id
  end
end
