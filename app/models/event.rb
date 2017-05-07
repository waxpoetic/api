# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  name         :string
#  location     :string
#  facebook_url :string
#  tickets_url  :string
#  starts_at    :datetime
#  open_at      :datetime
#  artist_id    :uuid
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_events_on_artist_id  (artist_id)
#

class Event < ApplicationRecord
  belongs_to :artist, required: false

  validates :name, presence: true
  validates :location, presence: true
  validates :starts_at, presence: true
end
