class TurnProcessor
  def initialize(game, board, target)
    @game = game
    @board = board
    @target = target
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

  private

  attr_reader :game, :target, :board
  def attack_opponent
    result = Shooter.fire!(board: board, target: target)
    @messages << "Your shot resulted in a #{result}."
    game.player_1_turns += 1
  end
end
