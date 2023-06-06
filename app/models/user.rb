# frozen_string_literal: true

class User < ApplicationRecord
  PHONE_REGEX = /[0-9]{3}[- ]?[0-9]{3}[- ]?[0-9]{2}[- ]?[0-9]{2}/

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  belongs_to :userable, polymorphic: true

  validates :phone, uniqueness: true, presence: true
  validates :phone, format: { with: PHONE_REGEX }
  validates :full_name, presence: true

  accepts_nested_attributes_for :userable

  enum role: { patient: 0, doctor: 1 }

  private

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
