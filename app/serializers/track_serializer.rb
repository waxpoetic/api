# frozen_string_literal: true

class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :number, :preview
  has_one :release

  def preview
    object.preview.url
  end
end
