# frozen_string_literal: true

RSpec.describe Appointment, :feature do
  let(:doctor) { create(:user, :doctor) }

  describe 'create a reccomendation as doctor' do
    before do
      patient = create(:patient)
      create(:appointment, doctor: doctor.userable, patient:)
      sign_in(doctor)
      visit doctors_appointments_path
      click_link('Create recommendation')
      fill_in('appointment_recommendation', with: 'Good')
      click_on('Give recommendation')
    end

    it { expect(page).to have_content(I18n.t('recommendation.success')) }
  end
end
