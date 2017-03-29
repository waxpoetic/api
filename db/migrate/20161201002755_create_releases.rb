# frozen_string_literal: true

class CreateReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :releases do |t|
      t.string :name
      t.uuid :artist_id, foreign_key: true, null: false, index: true
      t.string :description
      t.string :catalog_number
      t.string :cover_uid

      t.timestamps
    end
  end
end
