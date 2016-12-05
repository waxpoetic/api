# frozen_string_literal: true

require 'digest/md5'

# An EmailOctopus mailing list that people can subscribe and unsubscribe from.
class List
  attr_reader :id

  # @param id [String] Mailchimp List ID
  def initialize(id)
    @id = id
  end

  # Find a +List+ by the given ID or return +nil+ if none can be found.
  #
  # @return [List] or +nil+ when not valid.
  def self.find(id)
    list = new(id)
    return unless list.valid?
    list
  end

  def self.create(params = {})
    list = EmailOctopus::List.create(params)
    new(list.id)
  end

  # Test whether list can be found on EmailOctopus.
  #
  # @return [Boolean] whether +List+ is valid
  def valid?
    list.present?
  rescue EmailOctopus::Error => exception
    Rails.logger.error exception.message
    false
  end

  # Subscribe someone to the list.
  #
  # @param name [String] Name of the person being subscribed.
  # @param email [String] Valid email address.
  # @return [String] Contact ID for future requests.
  # @throw [EmailOctopus::API::Error] when an error occurs
  def subscribe(name: '', email: '')
    contact = Contact.new name: name, email: email
    record.create_contact(contact.attributes).id
  end

  # Unsubscribe an email address from the list.
  #
  # @param email [String] Valid email address.
  # @return [Boolean] whether unsubscription was successful.
  # @throw [EmailOctopus::API::Error] when an error occurs
  def unsubscribe(id)
    record.contacts.find(id).destroy
  end

  private

  # Finds an +EmailOctopus+ list by the given ID.
  #
  # @private
  # @return [EmailOctopus::List] API-driven model for existing list
  # @throws [EmailOctopus::API::Error::NotFound] when it cannot be found.
  def record
    @list ||= EmailOctopus::List.find id
  end
end
