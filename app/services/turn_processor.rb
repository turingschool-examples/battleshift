class TurnProcessor
  def initialize(game, target)
    @game   = game
    @target = target
    @messages = []
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

  def two_player_run!
    if game.current_turn == 'challenger'
      begin
        attack_opponent
        game.save!
      rescue InvalidAttack => e
        @messages << e.message
      end
    elsif game.current_turn == 'opponent'
      begin
        attack_player
        game.save!
      rescue InvalidAttack => e
        @messages << e.message
      end
    end
  end

  def message
    @messages.join(" ")
  end

  private

  attr_reader :game, :target

  def attack_opponent
    result = Shooter.fire!(board: opponent.board, target: target)
    @messages << "Your shot resulted in a #{result}."
    game.player_1_turns += 1
    game.current_turn = 2
  end

  def attack_player
    result = Shooter.fire!(board: player.board, target: target)
    @messages << "Your shot resulted in a #{result}."
    game.player_1_turns += 1
    game.current_turn = 0
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
