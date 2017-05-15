require "administrate/base_dashboard"

class ArtistDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    releases: Field::HasMany,
    images: Field::HasMany,
    events: Field::HasMany,
    id: Field::String.with_options(searchable: false),
    name: Field::String,
    bio: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    youtube_playlist_id: Field::String,
    starting_youtube_video_id: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :bio,
    :youtube_playlist_id,
    :starting_youtube_video_id,
    :releases,
    :images,
    :events,
    :id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :bio,
    :youtube_playlist_id,
    :starting_youtube_video_id,
    :releases,
    :images,
    :events,
    :id,
  ].freeze

  def display_resource(artist)
    artist.name
  end
end
