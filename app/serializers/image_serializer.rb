class ImageSerializer < ActiveModel::Serializer
  attributes :id, :position, :purpose, :file, :caption

  def file
    object.file.url
  end
end
