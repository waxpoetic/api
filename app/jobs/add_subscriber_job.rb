# frozen_string_literal: true

class AddSubscriberJob < ApplicationJob
  queue_as :default

  def perform(subscriber)
    subscriber.list.subscribe(
      name: subscriber.name,
      email: subscriber.email
    )
  end
end
