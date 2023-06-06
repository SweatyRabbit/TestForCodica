# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :phone,              null: false, index: { unique: true }
      t.string :encrypted_password, null: false

      t.string :full_name, null: false
      t.integer :role, default: 0
      t.datetime :remember_created_at
      t.belongs_to :userable, null: false, polymorphic: true, index: { unique: true }, type: :uuid

      t.timestamps null: false
    end
  end
end
