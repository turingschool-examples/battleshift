require 'rails_helper'

context 'A user posting to /api/v1/games/:id/shots' do
  describe 'can place a shot' do
    scenario 'that hits' do
      user, user2 = create_list(:activated_user, 2)
      board_size = 5

      game = create(
        :game,
        player_1_board: Board.new(board_size),
        player_2_board: Board.new(board_size)
      )
    end

    xscenario 'that misses' do

    end
  end
end
