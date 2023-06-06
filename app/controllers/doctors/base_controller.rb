# frozen_string_literal: true

module Doctors
  class BaseController < ApplicationController
    before_action :check_role

    private

    def check_role
      redirect_to root_path, alert: t('no_permission') unless current_user.doctor?
    end

    def current_doctor
      @current_doctor ||= current_user.userable
    end
  end
end
