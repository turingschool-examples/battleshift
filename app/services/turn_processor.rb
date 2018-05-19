class TurnProcessor
  def initialize(game, target, board_ref)
    @game   = game
    @target = target
    @board_ref = board_ref
    @messages = []
  end

  def run!
    begin
      attack_opponent
      game.swap_turn!
      game.save!
    rescue InvalidAttack => e
      @messages << e.message
    end
  end

  def message
    @messages.join(" ")
  end

  private

  attr_reader :game, :target, :board_ref

  def attack_opponent
    result = Shooter.fire!(board: game[board_ref], target: target)
    if result.include?("Battleship")
      game.sunken_ships
      if game.won? != nil
        result = "Hit. Battleship sunk. Game over"
      end
    end
    @messages << "Your shot resulted in a #{result}."
    game.player_1_turns += 1
  end

  def ai_attack_back
    result = AiSpaceSelector.new(player.board).fire!
    @messages << "The computer's shot resulted in a #{result}."
    game.player_2_turns += 1
  end

  def player
    Player.new(game.player_1_board)
  end

  def opponent
    Player.new(game.player_2_board)
  end

end
