# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, index: true
      t.string :email
      t.string :password_digest, null: false, index: true

      t.timestamps
    end
  end
end
