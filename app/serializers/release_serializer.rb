# frozen_string_literal: true

class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :catalog_number, :cover_uid
  has_one :artist

  def images
    object.images.map(&:url)
  end

  def id
    object.to_param
  end
end
