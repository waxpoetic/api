# frozen_string_literal: true

# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  name        :string
#  number      :integer
#  release_id  :integer
#  preview_uid :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tracks_on_release_id  (release_id)
#
# Foreign Keys
#
#  fk_rails_9aeb67bcaf  (release_id => releases.id)
#

class Track < ApplicationRecord
  belongs_to :release

  validates :name, presence: true

  scope :by_number, -> { order :number }
end
