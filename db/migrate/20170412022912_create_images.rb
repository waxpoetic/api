class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :imageable, foreign_key: true
      t.string :position
      t.string :purpose
      t.string :file_uid

      t.timestamps
    end
  end
end
