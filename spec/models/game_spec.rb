require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "relationships" do
    it { is_expected.to have_many(:game_players) }
    it { is_expected.to have_one(:player_1).through(:game_players) }
    it { is_expected.to have_one(:player_2).through(:game_players) }
  end
end
