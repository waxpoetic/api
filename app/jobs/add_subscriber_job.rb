# frozen_string_literal: true

class AddSubscriberJob < ApplicationJob
  queue_as :default

  def perform(subscriber)
    subscriber.update(
      contact_id: subscriber.list.subscribe(
        subscriber.attributes.slice(:name, :email)
      )
    )
  end
end
