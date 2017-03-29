# frozen_string_literal: true

class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :photo_uid
end
