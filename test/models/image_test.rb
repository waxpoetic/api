require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'generates position' do
    artist = artists(:wonderbars)
    file_path = Rails.root.join('test', 'fixtures', 'files', 'wonder-bars-live.jpg')
    file = File.open file_path
    image = Image.new file: file, imageable: artist

    assert image.save, image.errors.full_messages.to_sentence
    assert_equal 1, image.position
  end
end
