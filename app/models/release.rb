# frozen_string_literal: true
# == Schema Information
#
# Table name: releases
#
#  id             :integer          not null, primary key
#  name           :string
#  artist_id      :uuid             not null
#  description    :string
#  catalog_number :string
#  cover_uid      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_releases_on_artist_id  (artist_id)
#

class Release < ApplicationRecord
  belongs_to :artist

  has_many :tracks
  has_many :images, as: :imageable

  validates :name, presence: true
  validates :catalog_number, presence: true

  def cover_image
    images.cover.first
  end
end
