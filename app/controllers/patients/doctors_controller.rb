# frozen_string_literal: true

module Patients
  class DoctorsController < BaseController
    include Pagy::Backend

    def index
      @doctors = Doctor.all
      @pagy, @doctors = pagy(prepared_doctors)
    end

    private

    def prepared_doctors
      Patients::FilterDoctorsByCategory.new(params).call
    end
  end
end
