# frozen_string_literal: true

# == Schema Information
#
# Table name: releases
#
#  id             :integer          not null, primary key
#  name           :string
#  artist_id      :integer
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
# Foreign Keys
#
#  fk_rails_1b6ae5343f  (artist_id => artists.id)
#

class Release < ApplicationRecord
  belongs_to :artist

  has_many :tracks

  validates :name, presence: true
  validates :catalog_number, presence: true
end
