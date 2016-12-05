class RenameMailchimpListIdToListIdOnArtists < ActiveRecord::Migration[5.0]
  def change
    rename_column :artists, :mailchimp_list_id, :list_id
  end
end
