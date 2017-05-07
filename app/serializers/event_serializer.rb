class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :facebook_url, :tickets_url, :starts_at, :open_at
  has_one :artist
end
