# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    doctor
    patient
    date { Time.zone.tomorrow }
    status { :open }
  end
end
