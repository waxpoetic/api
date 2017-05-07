class ImageSerializer < ActiveModel::Serializer
  attributes :id, :position, :purpose

  def file
    object.file_url
  end
end
