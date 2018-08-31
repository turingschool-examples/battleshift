require 'rails_helper'

describe Game, type: :model do
  it "has attributes" do
    game = create(:game)

    expect(game.player_1_board).to be_a(Board)
    expect(game.player_2_board).to be_a(Board)
    expect(game.player_1_turns).to eq(0)
    expect(game.player_2_turns).to eq(0)
    expect(game.player_1_auth_token).to eq("ouhasdio")
    expect(game.player_2_auth_token).to eq("98has98hasd")
    expect(game.current_turn).to eq("player_1")
  end
end
