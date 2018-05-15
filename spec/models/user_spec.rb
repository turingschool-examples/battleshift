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
end
