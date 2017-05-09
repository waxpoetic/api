# frozen_string_literal: true

class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :photo_uid, :youtube_playlist_id, :starting_youtube_video_id

  def images
    object.images.map(&:url)
  end
end
