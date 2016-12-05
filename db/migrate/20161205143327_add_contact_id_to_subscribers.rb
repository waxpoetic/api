class AddContactIdToSubscribers < ActiveRecord::Migration[5.0]
  def change
    add_column :subscribers, :contact_id, :string
  end
end
