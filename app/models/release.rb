class Release < ApplicationRecord
  belongs_to :artist

  has_many :tracks

  validates :name, presence: true
  validates :catalog_number, presence: true
end
