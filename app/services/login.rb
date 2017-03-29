class Login
  # @param email [String] Email of user who is logging in
  # @param token [String] API token of user who is logging in
  def initialize(email: '', token: '', **_options)
    @email = email
    @token = token
  end

  # Test whether login was successful.
  #
  # @return [Boolean]
  def valid?
    user.present? && user.authenticate(@token)
  end

  # User who has been authenticated.
  #
  # @return [User]
  def user
    @user ||= User.find_by! email: @email
  end
end
