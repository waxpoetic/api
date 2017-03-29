# frozen_string_literal: true

require 'test_helper'

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  fixtures :artists

  setup do
    @artist = artists :wonderbars
  end

  test 'returns all artists' do
    get '/artists'

    assert_equal 200, status
    refute_empty json[:events]
  end

  test 'returns all artists matching name' do
    get "/artists?name=#{@artist.name}"

    assert_equal 200, status
    refute_empty json[:artists]
    assert_equal @artist.id, json[:artists].first[:id]
  end

  test 'returns single artist matching id' do
    get "/artists/#{@artist.id}"

    assert_equal 200, status
    assert_equal @artist.name, json[:artist][:name]
  end
end
