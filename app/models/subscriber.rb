class Subscriber < ApplicationRecord
  belongs_to :artist, optional: true

  before_validation :ensure_list_id

  validates :email, presence: true
  validates :list_id, presence: true
  validate :list_exists

  after_create :add_to_list
  before_destroy :remove_from_list

  def list
    @list ||= List.find list_id
  end

  private

  def add_to_list
    AddSubscriberJob.perform_later self
  end

  def remove_from_list
    RemoveSubscriberJob.perform_later self
  end

  def ensure_list_id
    self.list_id ||= artist&.list_id
  end

  def list_exists
    list.present?
  end
end
