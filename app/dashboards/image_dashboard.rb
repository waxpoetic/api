require "administrate/base_dashboard"

class ImageDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    imageable: Field::Polymorphic,
    id: Field::Number,
    position: Field::Number,
    purpose: Field::String,
    file_uid: Field::String,
    file_name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    caption: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :file_name,
    :position,
    :purpose,
    :imageable
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :imageable,
    :id,
    :position,
    :purpose,
    :file_uid,
    :file_name,
    :created_at,
    :updated_at,
    :caption,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :imageable,
    :position,
    :purpose,
    :file_uid,
    :file_name,
    :caption,
  ].freeze

  def display_resource(image)
    image.file_name
  end
end
