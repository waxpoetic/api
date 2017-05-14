class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :facebook_url, :tickets_url, :starts_at, :open_at, :image
  has_one :artist

  def image
    object.image.url
  end
end
