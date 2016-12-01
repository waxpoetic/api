class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :catalog_number, :cover_uid
  has_one :artist
end
