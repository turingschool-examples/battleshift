require 'rails_helper'

describe User do
  describe 'attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'update status' do
    it 'updates a user to active' do
      user = create(:user)

      user.status = 'active'
      user.save

      expect(user.status).to_not eq('inactive')
      expect(user.status).to eq('active')
    end
  end

  describe 'instance methods' do
    it 'creates a random key' do
      user = User.create!(name: 'thrasher', email: 'thrasherman@fluffy.com', password: 'test')

      expect(user.api_key).to be_a String
    end
  end
end
