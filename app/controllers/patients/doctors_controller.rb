# frozen_string_literal: true

module Patients
  class DoctorsController < BaseController
    def index
      @doctors = prepared_doctors
    end

    private

    def prepared_doctors
      Patients::FilterDoctorsByCategory.new(params).call
    end
  end
end
