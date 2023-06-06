# frozen_string_literal: true

module Patients
  class FilterDoctorsByCategory
    def initialize(params)
      @category_name = params[:filter_by]
    end

    def call
      show_doctors_by_category
    end

    private

    def show_doctors_by_category
      @doctors = @category_name ? Doctor.joins(:category).where(category: { name: @category_name }) : Doctor.all
    end
  end
end
