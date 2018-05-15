require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }
  end

  describe 'instance methods' do
    let(:unregistered) { create(:unregistered_user) }
    let(:registered) { create(:user) }

    it '#activated?' do
      expect(unregistered.activated?).to be_falsey 
      expect(registered.activated?).to be_truthy 
    end

    it '#activate!' do
      unregistered.activate!
      expect(unregistered.activated?).to be_truthy 
    end
  end

  describe 'class methods' do
    let(:user) { create(:unregistered_user) }

    it '.find_and_activate' do
      found = User.find_and_activate(user.id)

      expect(found).to eq(user)  
      expect(found.activated?).to be_truthy
    end
  end
end
