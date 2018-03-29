require 'rails_helper'

describe GamePlayer, type: :model do
  describe "relationships" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:game) }
  end
end
