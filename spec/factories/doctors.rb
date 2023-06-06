# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    category { association(:category) }
    user { association(:user, userable: instance) }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/doctor.png'), 'image/png') }
  end
end
