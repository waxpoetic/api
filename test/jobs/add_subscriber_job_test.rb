require 'test_helper'

class AddSubscriberJobTest < ActiveJob::TestCase
  def setup
    @subscriber = subscribers(:main)
  end

  test 'add subscriber to list' do
    VCR.use_cassette :add_subscriber_to_main_list do
      assert AddSubscriberJob.perform_now(@subscriber)
    end
  end
end
