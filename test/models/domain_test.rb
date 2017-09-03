require 'test_helper'

class DomainTest < ActiveSupport::TestCase
  setup do
    @id = 'catalog'
    @name = 'catalog.test.host'
    @domain = Domain.new(id: @id, name: @name)
  end

  test 'exposes name' do
    assert_equal @name, @domain.name
  end

  test 'exposes id' do
    assert_equal @id, @domain.id
  end

  test 'can be found by domain name' do
    assert_equal @domain, Domain.find(@name)
  end
end
