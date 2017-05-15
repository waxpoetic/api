# frozen_string_literal: true

class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :catalog_number

  has_one :artist do
    include_data :if_sideloaded
    link :self, Rails.application.routes.url_helpers.artist_path(object.artist)
  end

  has_many :tracks do
    include_data :if_sideloaded
    link :self, Rails.application.routes.url_helpers.tracks_path(release: object)
  end

  def id
    object.to_param
  end
end
