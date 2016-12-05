class Artist < ApplicationRecord
  has_many :releases

  after_create :create_mailing_list

  private

  def create_mailing_list
    CreateArtistMailingListJob.perform_later self
  end
end
