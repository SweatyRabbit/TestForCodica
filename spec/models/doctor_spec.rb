# frozen_string_literal: true

RSpec.describe Doctor, :model do
  describe 'phone validation' do
    subject(:user) { build(:user, :doctor) }

    context 'when invalid' do
      subject(:user) { build(:user, :doctor, phone: '123') }

      before { user.valid? }

      it { is_expected.to be_invalid }

      it 'generates error for phone' do
        expect(user.errors[:phone]).to eq([I18n.t('errors.messages.invalid')])
      end
    end

    context 'when valid' do
      it { is_expected.to be_valid }
    end
  end
end
