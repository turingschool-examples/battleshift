require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { is_expected.to have_many(:games).through(:game_players)}
  end

  it "is valid" do
    user = create(:user)

    expect(user).to be_valid
  end
end
