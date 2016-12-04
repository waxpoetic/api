class CreateSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribers do |t|
      t.string :name
      t.string :email
      t.string :list_id
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
