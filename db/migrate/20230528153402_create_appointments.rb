# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments, id: :uuid do |t|
      t.belongs_to :patient, null: false, type: :uuid
      t.belongs_to :doctor, null: false, type: :uuid
      t.date :date, null: false
      t.text :recommendation, default: ''
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
