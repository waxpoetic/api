class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true
      t.integer :position, index: true
      t.string :purpose, index: true
      t.string :file_uid, index: true, unique: true
      t.string :file_name

      t.timestamps
    end
  end
end
