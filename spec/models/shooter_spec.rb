require 'rails_helper'

RSpec.describe Shooter, type: :model do
  it 'can fire only at valid coordinates' do
    user_1 = create(:user)
    user_2 = create(:user2)

    game = Game.create(player_1_board: Board.new(4),
                       player_2_board: Board.new(4),
                       player_1_turns: 0,
                       player_2_turns: 0,
                       current_turn: "player 1",
                       player_1_id: user_1.id,
                       player_2_id: user_2.id
    )

    coordinates = "A1"
    board_1 = game.player_1_board
    board_2 = game.player_2_board
    # binding.pry
    #ATTEMPT AT ALLOW_ANY_INSTANCE_OF
    # allow_any_instance_of(Board).to receive(:space_names).and_return("Hit")
    space = board_1.locate_space(coordinates)

    shooter = Shooter.new(board: board_1, target: "A1")


    # binding.pry
    shooter.fire!

    expect(space.status).to eq("Miss")

    coordinates_2 = "F9"
    space_2 = board_2.locate_space(coordinates_2)

    shooter_2 = Shooter.new(board: board_2, target: space_2)
    expect { shooter_2.fire! }.to raise_error(InvalidAttack)

  end
end
