require 'test_helper'

class MultisiteTest < ActionDispatch::IntegrationTest
  test 'renders mindbrain app on mindbrainmusic.com' do
    get root_url(host: 'catalog.test.host')

    assert_select 'script', src: /catalog/
  end

  test 'renders wonderbars app on thewonderbars.com' do
    get root_url(host: 'wonderbars.test.host')

    assert_select 'script', src: /catalog/
  end
end
