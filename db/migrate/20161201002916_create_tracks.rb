# frozen_string_literal: true

class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :number
      t.references :release, foreign_key: true
      t.string :preview_uid

      t.timestamps
    end
  end
end
