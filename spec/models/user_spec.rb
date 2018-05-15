require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :username }
    it { should validate_uniqueness_of :email }
  end

  describe 'class methods' do
    describe '#set_keys and #generate_keys' do
      it 'generate an api key (in combination) before save' do
        user = User.new(username: 'username', email: 'email@email.com', password: 'password')

        expect(user.api_key).to be_nil

        user.save!

        expect(user.api_key).to_not be_nil
      end
      it 'generate a token (in combination) before save' do
        user = User.new(username: 'username', email: 'email@email.com', password: 'password')

        expect(user.token).to be_nil

        user.save!

        expect(user.token).to_not be_nil
      end
    end
  end
end
