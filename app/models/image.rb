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
