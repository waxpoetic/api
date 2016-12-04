class SubscriberSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :list_id
  has_one :artist
end
