require "administrate/base_dashboard"

class ReleaseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    artist: Field::BelongsTo,
    tracks: Field::HasMany,
    images: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    description: Field::String,
    catalog_number: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :artist,
    :tracks,
    :images,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :artist,
    :tracks,
    :images,
    :id,
    :name,
    :description,
    :catalog_number,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :artist,
    :tracks,
    :images,
    :name,
    :description,
    :catalog_number,
  ].freeze

  def display_resource(release)
    "#{release.name} (#{release.catalog_number})"
  end
end
