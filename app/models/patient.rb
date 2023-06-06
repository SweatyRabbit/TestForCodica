# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :user, dependent: :destroy, as: :userable

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  accepts_nested_attributes_for :user
end
