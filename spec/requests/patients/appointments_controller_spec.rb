# frozen_string_literal: true

RSpec.describe 'Patients::AppointmentsController' do
  describe 'POST #create' do
    let(:user) { create(:user) }

    context 'when success' do
      before do
        sign_in(user)
        post patients_appointments_path,
             params: { appointment: { doctor_id: create(:doctor).id, date: Time.zone.tomorrow } }, as: :turbo_stream
      end

      it 'redirect doctors page' do
        expect(response).to redirect_to patients_doctors_path
      end
    end

    context 'when failure' do
      before do
        sign_in(user)
        post patients_appointments_path, params: { appointment: { doctor_id: create(:doctor).id, date: '' } },
                                         as: :turbo_stream
      end

      it 'return errors' do
        expect(response.body).to include(CGI.escapeHTML(I18n.t('errors.messages.blank')))
      end
    end
  end
end
