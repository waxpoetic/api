# frozen_string_literal: true

class CreateReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :releases do |t|
      t.string :name
      t.references :artist, foreign_key: true
      t.string :description
      t.string :catalog_number
      t.string :cover_uid

      t.timestamps
    end
  end
end
