# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string           not null
#

class User < ApplicationRecord
  has_secure_password

  before_validation :generate_password, on: :create

  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true

  has_many :articles

  private

  def generate_password
    self.password = SecureRandom.hex
  end
end
