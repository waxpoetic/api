# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
