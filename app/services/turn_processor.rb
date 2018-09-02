class TurnProcessor
  def initialize(game, target)
    @game     = game
    @target   = target
    @messages = []
  end

  def run!
    begin
      attack_opponent
      game.save!
    rescue InvalidAttack => e
      @messages << e.message
    end
  end

  def message
    @messages.join(" ")
  end

  def game_over?
    opponent.ships.all? do |ship|
      ship.is_sunk?
    end
  end

  private

  attr_reader :game, :target

  def attack_opponent
    result = Shooter.fire!(board: opponent, target: target)
    @messages << "Your shot resulted in a #{space.status}."
    if has_ship? && space.contents.is_sunk?
      @messages << "Battleship sunk."
      if game_over?
        game.winner = game.current_turn_user.email
        game.save!
        @messages << "Game over."
      end
    end
  end

  def has_ship?
    space.contents != nil
  end

  def space
    @space ||= opponent.locate_space(target)
  end

  def opponent
    if game.current_turn == "player 1"
      game.player_2_board
    else
      game.player_1_board
    end
  end

end
