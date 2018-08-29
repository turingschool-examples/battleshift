class TurnProcessor
  def initialize(game, target)
    @game   = game
    @target = target
    @messages = []
    if game.current_turn == "player_one"
      @player = Player.new(@game.player_1_board, @game.player_1_turns)
      @opponent = Player.new(@game.player_2_board, @game.player_2_turns)
    else
      @player = Player.new(@game.player_2_board, @game.player_2_turns)
      @opponent = Player.new(@game.player_1_board, @game.player_1_turns)
    end
  end

  def run!
    begin
      attack_opponent
      ai_attack_back
      game.save!
    rescue InvalidAttack => e
      @messages << e.message
    end
  end

  # def run!
  #   attack_opponent
  # end

  def message
    @messages.join(" ")
  end

  private

  attr_reader :game, :target

  def attack_opponent
    result = Shooter.fire!(board: @opponent.board, target: @target)
    @messages << "Your shot resulted in a #{result}."
    @player.turn_count += 1
  end

end
