require 'test_helper'

class Artists::IndexTest < DocumentationTest
  fixtures :artists

  meta :group,          'Artists'
  meta :request_method, 'GET'
  meta :request_path,   '/artists'
  meta :description,    'Return all artists or filter/sort by any attribute'

  param :name, 'Filter results by name'
  param :sort, 'Sort results by given comma-separated keys'

  example 'Return all artists' do
    get '/artists' do
      assert_include 'artists', json.keys
      assert_equal 1, json['artists'].size
    end
  end

  example 'Search artists by name' do
    get '/artists?name=The+Wonder+Bars' do
      assert_include 'artists', json.keys
      assert_equal 1, json['artists'].size
      assert_equal 'The Wonder Bars', json['artists'].first['name']
    end
  end

  example 'Sort artists by created_at' do
    get '/artists?sort=created_at' do
      assert_include 'artists', json.keys
      assert_equal 2, json['artists'].size
      assert_equal 'The Wonder Bars', json['artists'].last['name']
    end
  end
end
