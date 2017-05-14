# frozen_string_literal: true
# == Schema Information
#
# Table name: artists
#
#  id                        :uuid             not null, primary key
#  name                      :string
#  bio                       :string
#  photo_uid                 :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  youtube_playlist_id       :string
#  starting_youtube_video_id :string
#

class Artist < ApplicationRecord
  has_many :releases
  has_many :images, as: :imageable
  has_many :events

  validates :name, presence: true

  def profile_image
    images.find_by purpose: 'profile'
  end
end
