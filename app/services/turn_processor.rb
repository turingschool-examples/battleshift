class TurnProcessor
  def initialize(game, board, target)
    @game = game
    @board = board
    @target = target
    @messages = []
  end

  # def attack(board)
  #   attack_opponent(board)
  # end

  def run!
    begin

      attack_opponent
      # ai_attack_back
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
    @messages << "Your shot resulted in a #{result}."
    game.player_1_turns += 1
  end

  def ai_attack_back
    result = AiSpaceSelector.new(player.board).fire!
    @messages << "The computer's shot resulted in a #{result}."
    game.player_2_turns += 1
  end

  def player
    @user
    # Player.new(game.player_1_board)
  end

  def opponent
    # Player.new(game.player_2_board)
  end

end
