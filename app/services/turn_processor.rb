class TurnProcessor
  def initialize(game, target, board)
    @game     = game
    @target   = target
    @messages = []
    @board    = board
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

  attr_reader :game, :target

  def attack_opponent
    result = Shooter.new(board: @board, target: target).fire!
    @messages << "Your shot resulted in a #{result[:ship_status]}."
    @messages << "Battleship sunk." if result[:sunk] == true
    @messages << "Game over." if result[:game_over] == true
  end
end
