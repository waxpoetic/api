require 'test_helper'

class ReleasesControllerTest < ActionDispatch::IntegrationTest
  test 'find all releases' do
    get releases_path

    assert_response :success
  end

  test 'find single release' do
    release = releases :wxp001
    get releases_path(release)

    assert_response :success
  end
end
