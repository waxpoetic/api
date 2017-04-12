# frozen_string_literal: true

require 'test_helper'

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  fixtures :artists

  setup do
    @artist = artists :wonderbars
  end

  test 'returns all artists' do
    get '/artists.json'

    assert_equal 200, status
    refute_empty response
  end

  test 'returns all artists matching name' do
    get "/artists.json?name=#{@artist.name}"

    assert_equal 200, status
    assert_equal @artist.id, response[:data][0][:id]
  end

  test 'returns single artist matching id' do
    get "/artists/#{@artist.id}.json"

    assert_equal 200, status
    assert_equal @artist.name, response[:data][:attributes][:name]
  end
end
