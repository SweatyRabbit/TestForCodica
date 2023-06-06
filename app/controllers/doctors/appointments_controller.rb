# frozen_string_literal: true

module Doctors
  class AppointmentsController < BaseController
    before_action :set_appointment, only: %i[edit update]

    def index
      @appointments = current_doctor.appointments
    end

    def edit; end

    def update
      @appointment.update(update_params.merge(status: :closed))

      redirect_to doctors_appointments_path, notice: t('recommendation.success') if @appointment.valid?
    end

    private

    def set_appointment
      @appointment = current_doctor.appointments.open.find_by(id: params[:id])
    end

    def update_params
      params.require(:appointment).permit(:recommendation)
    end
  end
end
