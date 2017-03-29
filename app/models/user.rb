# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  name                  :string
#  email                 :string
#  password              :string
#  password_confirmation :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class User < ApplicationRecord
  def self.authenticate!(email: '', token: '', **_options)
    find_by email: email, token: token
  rescue ActiveRecord::RecordNotFound
    raise AuthenticationError
  end
end
