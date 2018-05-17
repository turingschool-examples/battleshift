class TurnProcessor
  def initialize(game, target, player, opponent)
    @game   = game
    @target = target
    @player = player
    @opponent = opponent
    @messages = []
  end

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

  attr_reader :game, :target

  def attack_opponent
    result = Shooter.fire!(board: @opponent.board, target: target)
    @messages << "Your shot resulted in a #{result}."

    if game.current_turn.last.to_i.odd?
      game.current_turn = 'player_2'
    else
      game.current_turn = 'player_1'
    end
  end

  #
  # def ai_attack_back
  #   result = AiSpaceSelector.new(player.board).fire!
  #   @messages << "The computer's shot resulted in a #{result}."
  #   game.player_2_turns += 1
  # end

end
