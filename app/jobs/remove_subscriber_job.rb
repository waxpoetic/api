class RemoveSubscriberJob < ApplicationJob
  queue_as :default

  def perform(subscriber)
    subscriber.list.unsubscribe(subscriber.email)
  end
end
