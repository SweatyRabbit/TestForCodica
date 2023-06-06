# frozen_string_literal: true

class Appointment < ApplicationRecord
  MAX_APPOINTMENTS_COUNT = 10

  belongs_to :patient, optional: false
  belongs_to :doctor, optional: false

  validates :recommendation, presence: true, if: :closed?
  validates :date, comparison: { greater_than: Time.zone.today }
  validate :validate_doctor, if: -> { doctor.present? }

  enum status: { open: 0, closed: 1 }

  private

  def validate_doctor
    return if doctor.appointments.open.count <= MAX_APPOINTMENTS_COUNT

    errors.add(:doctor, "already has #{MAX_APPOINTMENTS_COUNT} appointments")
  end
end
