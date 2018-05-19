require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'can swap whose turn it is' do
    p1, p2 = create_list(:user, 2)

    game = create(:game, player_1: p1, player_2: p2)
    expect(game.current_turn).to eq("player_1")
    game.swap_turn!
    expect(game.current_turn).to eq("player_2")
    game.swap_turn!
    expect(game.current_turn).to eq("player_1")
  end
end
