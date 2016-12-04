require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  def setup
    @artist = artists(:wonderbars)
    @subscriber = Subscriber.new(
      name: 'Lester Tester',
      email: 'lester.tester@example.com'
    )
  end

  test 'find list from list_id' do
    @subscriber.list_id = 'foo'

    assert_valid @subscriber
  end

  test 'use artist list' do
    @subscriber.artist = @artist

    assert_valid @subscriber
    assert_equal @subscriber.list_id, @artist.mailchimp_list_id
  end

  test 'invalid when no list_id exists' do
    refute_valid @subscriber
  end

  test 'invalid when list_id does not correspond to a list' do
    @subscriber.list_id = 'nonexistant'
    refute_valid @subscriber
  end

  test 'adds subscriber to list when created' do
    VCR.use_cassette :add_subscriber_to_artist_list do
      @subscriber.artist = @artist
      assert @subscriber.save
    end
  end

  test 'removes subscriber from list when destroyed' do
    VCR.use_cassette :remove_subscriber_from_artist_list do
      subscriber = subscribers(:artist)
      assert subscriber.destroy
    end
  end
end
