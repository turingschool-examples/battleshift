class TurnProcessor
  def initialize(game, target, board)
    @game   = game
    @target = target
    @board = board
    @messages = []
  end

  def run!
    begin
      attack_opponent
      ai_attack_back
      binding.pry
      game.save!
    rescue InvalidAttack => e
      @messages << e.message
    end
  end

  def message
    @messages.join(" ")
  end

  private

  attr_reader :game, :target, :board

  def attack_opponent
    result = Shooter.fire!(board: board, target: target)
    binding.pry
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
