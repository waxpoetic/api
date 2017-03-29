require 'test_helper'

class Artists::ShowTest < DocumentationTest
  fixtures :artists

  meta :group,          'Artists'
  meta :request_method, 'GET'
  meta :request_path,   '/artists/:id'
  meta :description,    "Return a single artist's JSON data"

  param :id, 'ID of the artist', required: true

  example 'Requesting a single artist' do
    get "/artists/1" do
      assert_equal 'The Wonder Bars', json['artist']['name']
    end
  end
end
