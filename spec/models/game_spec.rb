require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "relationships" do
    it { is_expected.to have_many(:game_players) }
    it { is_expected.to have_many(:users).through(:game_players) }
  end
end
