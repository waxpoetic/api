# frozen_string_literal: true

require 'digest/md5'

# A Mailchimp list that users can subscribe and unsubscribe from.
class List
  # @param id [String] Mailchimp List ID
  def initialize(id)
    @id = id
    @api_key = Rails.application.secrets.mailchimp_api_key
  end

  # Subscribe someone to the list.
  #
  # @param name [String] Name of the person being subscribed.
  # @param email [String] Valid email address.
  # @return [Boolean] whether subscription was successful.
  def subscribe(name: '', email: '')
    list.members.create(
      body: {
        email_address: email,
        status: 'subscribed',
        merge_fields: {
          NAME: name
        }
      }
    )
  end

  # Unsubscribe an email address from the list.
  #
  # @param email [String] Valid email address.
  # @return [Boolean] whether unsubscription was successful.
  def unsubscribe(email)
    member_id = Digest::MD5.digest(email.downcase)
    list.members(member_id).update(body: { status: 'unsubscribed' })
  end

  private

  def list
    @list ||= gibbon.lists(id)
  end

  def gibbon
    @gibbon ||= Gibbon::Request.new api_key: @api_key
  end
end
