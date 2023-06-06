# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    phone { FFaker::PhoneNumberUA.mobile_phone_number }
    full_name { FFaker::Name.name }
    password { FFaker::Internet.password }
    role { :patient }
    userable { association(:patient, user: instance) }

    trait :doctor do
      userable { association(:doctor, user: instance) }
      role { :doctor }
    end
  end
end
