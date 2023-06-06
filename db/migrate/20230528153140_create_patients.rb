# frozen_string_literal: true

class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients, id: :uuid, &:timestamps
  end
end
