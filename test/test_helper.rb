# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  protected

  def json
    JSON.parse(body).deep_symbolize_keys
  end
end

class DocumentationTest < ActiveSupport::TestCase
  i_suck_and_my_tests_are_order_dependent!
end
