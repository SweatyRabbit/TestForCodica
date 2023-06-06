# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def build_resource(hash = {})
      super
      resource.userable = Patient.new
    end

    def update_resource(resource, params)
      super
      resource.userable.update(userable_params)
    end

    private

    def userable_params
      params.require(:user).permit(userable_attributes: %i[avatar])[:userable_attributes] || {}
    end
  end
end
