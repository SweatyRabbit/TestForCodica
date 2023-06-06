# frozen_string_literal: true

module Patients
  class BaseController < ApplicationController
    before_action :check_role

    private

    def check_role
      redirect_to root_path, alert: t('no_permission') unless current_user.patient?
    end

    def current_patient
      @current_patient ||= current_user.userable
    end
  end
end
