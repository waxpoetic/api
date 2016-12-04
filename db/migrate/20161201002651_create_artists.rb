class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :bio
      t.string :photo_uid
      t.string :mailchimp_list_id

      t.timestamps
    end
  end
end
