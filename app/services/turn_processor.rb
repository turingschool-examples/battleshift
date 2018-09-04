class TurnProcessor
  attr_reader :status

  def initialize(game, target, key = 'computer')
    @game   = game
    @target = target
    @messages = []
    @key = key
    @status = 200
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
  if game.winner != nil
    @messages << "Invalid move. Game over."
    @status = 400
  elsif game.current_turn == 'challenger' && @key == game.player_key
      begin
        attack_opponent
        game.save!
      rescue InvalidAttack => e
        @messages << e.message
      end
    elsif game.current_turn == 'opponent' && @key == game.opponent_key
      begin
        attack_player
        game.save!
      rescue InvalidAttack => e
        @messages << e.message
      end
    else
      @status = 400
      @messages << "Invalid move. It's your opponent's turn"
    end
  end

  def message
    @messages.join(" ")
  end

  private

  attr_reader :game, :target

  def attack_opponent
    result = Shooter.new(board: opponent.board, target: target).fire!
    if result == "Invalid coordinates"
      @status = 400
      @messages << result
    elsif result == "Hit. Battleship sunk."
      game.opponent_sunk_counter += 1
      if game.opponent_sunk_counter < 2
        @messages << "Your shot resulted in a #{result}."
        game.player_1_turns += 1
        game.current_turn = 2
      else
        @messages << "Your shot resulted in a #{result} Game over."
        user = User.find_by(api_token: game.player_key)
        game.update_attribute(:winner, user.email)
      end
    else
      @messages << "Your shot resulted in a #{result}."
      game.player_1_turns += 1
      game.current_turn = 2
    end
  end

  def attack_player
    result = Shooter.new(board: player.board, target: target).fire!
    if result == "Invalid coordinates"
      @status = 400
      @messages << result
    elsif result == "Hit. Battleship sunk."
      game.player_sunk_counter += 1
      if game.player_sunk_counter < 2
        @messages << "Your shot resulted in a #{result}."
        game.player_2_turns += 1
        game.current_turn = 0
      else
        @messages << "Your shot resulted in a #{result} Game over."
        user = User.find_by(api_token: game.opponent_key)
        game.update_attribute(:winner, user.email)
      end
    else
      @messages << "Your shot resulted in a #{result}."
      game.player_2_turns += 1
      game.current_turn = 0
    end
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
