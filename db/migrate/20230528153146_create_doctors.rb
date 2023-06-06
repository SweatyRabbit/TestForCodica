# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors, id: :uuid do |t|
      t.belongs_to :category, null: false, type: :uuid

      t.timestamps
    end
  end
end
