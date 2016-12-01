class User < ApplicationRecord
  def self.authenticate!(email: '', token: '', **_options)
    find_by email: email, token: token
  rescue ActiveRecord::RecordNotFound
    raise AuthenticationError
  end
end
