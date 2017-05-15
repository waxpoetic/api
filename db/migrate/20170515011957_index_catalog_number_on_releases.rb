class IndexCatalogNumberOnReleases < ActiveRecord::Migration[5.1]
  def change
    add_index :releases, :catalog_number, unique: true
  end
end
