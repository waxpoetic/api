class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :number, :preview_uid
  has_one :release
end
