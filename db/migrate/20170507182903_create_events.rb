class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :facebook_url
      t.string :tickets_url
      t.datetime :starts_at
      t.datetime :open_at
      t.uuid :artist_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
