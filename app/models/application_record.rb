# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  extend Dragonfly::Model
  extend Dragonfly::Model::Validations

  def self.find!(id)
    find id
  rescue ActiveRecord::RecordNotFound
  end
end
