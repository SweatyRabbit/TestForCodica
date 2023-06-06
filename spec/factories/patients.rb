# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    user { association(:user, userable: instance) }
  end
end
