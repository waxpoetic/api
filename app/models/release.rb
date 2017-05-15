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
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_releases_on_artist_id       (artist_id)
#  index_releases_on_catalog_number  (catalog_number) UNIQUE
#

class Release < ApplicationRecord
  belongs_to :artist

  has_many :tracks
  has_many :images, as: :imageable

  validates :name, presence: true
  validates :catalog_number, presence: true, uniqueness: true

  def cover_image
    images.cover.first
  end

  def to_param
    catalog_number.downcase
  end
end
