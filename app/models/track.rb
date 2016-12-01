class Track < ApplicationRecord
  belongs_to :release

  validates :name, presence: true

  scope :by_number, -> { order :number }
end
