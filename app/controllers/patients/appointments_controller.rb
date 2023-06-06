# frozen_string_literal: true

module Patients
  class AppointmentsController < BaseController
    def index
      @appointments = current_patient.appointments
    end

    def show
      @appointment = current_patient.appointments.find_by(id: params[:id])
    end

    def new
      doctor = Doctor.find_by(id: params[:doctor_id])
      @appointment = doctor.appointments.new(patient: current_patient)
    end

    def create
      @appointment = current_patient.appointments.create(create_params)

      redirect_to patients_doctors_path, notice: t('appointments.success') if @appointment.errors.none?
    end

    private

    def create_params
      params.require(:appointment).permit(:doctor_id, :date)
    end
  end
end
