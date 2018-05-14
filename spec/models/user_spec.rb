require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  describe 'instance methods' do
    let(:unregistered) { create(:unregistered_user) }
    let(:registered) { create(:user) }

    it '#activated?' do
      expect(unregistered.activated?).to eq(false)
      expect(registered.activated?).to eq(true)
    end

    it '#activate' do
      unregistered.activate
      expect(unregistered.activated?).to eq(true)
    end
  end
end
