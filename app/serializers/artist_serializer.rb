# frozen_string_literal: true

class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :youtube_playlist_id, :starting_youtube_video_id

  has_many :images
  has_many :releases
end
