# frozen_string_literal: true

class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'
    create_table :artists, id: :uuid do |t|
      t.string :name
      t.string :bio

      t.timestamps
    end
  end
end
