require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:email)}
  it {should validate_uniqueness_of(:email)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:password)}
  it {should have_secure_password}

  describe "instance methods" do
    it 'can generate an api key' do
      user = User.create(email: 'email@email.io', name: 'First Last', password: '123')

      expect(user.api_key).to eq(nil)
      user.generate_api_key
      expect(user.api_key).to be_a(String)
      expect(user.api_key.length).to eq(22)
    end 
  end
end