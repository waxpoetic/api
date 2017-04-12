# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  imageable_type :string
#  imageable_id   :integer
#  position       :integer
#  purpose        :string
#  file_uid       :string
#  file_name      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_images_on_file_uid                         (file_uid)
#  index_images_on_imageable_type_and_imageable_id  (imageable_type,imageable_id)
#  index_images_on_position                         (position)
#  index_images_on_purpose                          (purpose)
#

class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  dragonfly_accessor :file

  def method_missing(method, *arguments)
    return super unless respond_to? method
    file.public_send method, *arguments
  end

  def respond_to_missing?(method, include_private = false)
    file&.respond_to?(method) || super
  end
end
