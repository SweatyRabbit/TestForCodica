# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_one :user, dependent: :destroy, as: :userable
  belongs_to :category, optional: false

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  has_one_attached :avatar, dependent: :destroy

  accepts_nested_attributes_for :user
end
