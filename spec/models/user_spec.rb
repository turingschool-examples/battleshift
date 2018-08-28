require "rails_helper"

describe User, type: :model do
  describe "attributes" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:status) }
  end

  describe "status" do
    it "status be inactive" do
      user = create(:user)

      expect(user.status).to eq('inactive')
    end

    it "status can be active" do
      user = create(:user, status: 1)

      expect(user.status).to eq('active')
    end

    it "can be updated" do
      user = create(:user)

      user.update_attributes(status: "active")

      user.update_attributes(name: "bill")

      expect(user.name).to eq("bill")
      expect(user.status).to eq('active')
    end
  end

  describe "instance methods" do
    describe "#confirm_registration" do
      it "changes status from inactive to active" do
        user = create(:user)

        expect(user.status).to eq("inactive")

        user.confirm_registration
        expect(user.status).to eq("active")
      end
    end
  end
end
