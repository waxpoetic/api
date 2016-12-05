class RemoveSubscriberJob < ApplicationJob
  queue_as :default

  def perform(subscriber)
    subscriber.contact_id = nil
    subscriber.list.unsubscribe(subscriber.email) && subscriber.save
  end
end
