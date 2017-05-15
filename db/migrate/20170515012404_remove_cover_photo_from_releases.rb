class RemoveCoverPhotoFromReleases < ActiveRecord::Migration[5.1]
  def change
    remove_column :releases, :cover_uid, :string
  end
end
