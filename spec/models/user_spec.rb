require "rails_helper"

describe User, type: :model do
  describe "attributes" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:status) }
  end

  describe "status" do
    it "status be active" do
      user = create(:user)

      expect(user.status).to eq('inactive')
    end

    it "status can be inactive" do
      user = create(:user, status: 1)

      expect(user.status).to eq('active')
    end
  end
end
