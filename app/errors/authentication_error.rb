# frozen_string_literal: true

# Thrown when an invalid user token is given and access to a protected
# resource has been requested.
class AuthenticationError < StandardError
  def initialize
    super 'You must be authenticated to view this resource.'
  end
end
