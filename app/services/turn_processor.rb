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

  def valid_coordinate?
    @opponent.board.board.flatten.map do |coord|
      coord.keys[0]
    end.include?(target)
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

    if winner?
      @messages << "Game over."
    end

  end

  def winner?
    game && player_1_winner? || game && player_2_winner?
  end

  def player_1_winner?
    if player_2_board_total_hits >= player_2_total_occupied_spaces
      winner_email(game.player_1)
      return true
    end
  end

  def player_2_winner?
    if player_1_board_total_hits >= player_1_total_occupied_spaces
      winner_email(game.player_2)
      return true
    end
  end

  def winner_email(player)
    game.winner = User.find_by(api_key: player.api_key)
    game.save
    # require 'pry'; binding.pry
  end

  def player_2_board_total_hits
    game.player_2.board.board.flatten.map(&:values).flatten.map(&:contents).compact.select { |contents| contents.damage != 0 }.size
  end

  def player_2_total_occupied_spaces
    game.player_2.board.board.flatten.map(&:values).flatten.map(&:contents).compact.size
  end

  def player_1_board_total_hits
    game.player_1.board.board.flatten.map(&:values).flatten.map(&:contents).compact.select { |contents| contents.damage != 0 }.size
  end

  def player_1_total_occupied_spaces
    game.player_1.board.board.flatten.map(&:values).flatten.map(&:contents).compact.size
  end

  #
  # def ai_attack_back
  #   result = AiSpaceSelector.new(player.board).fire!
  #   @messages << "The computer's shot resulted in a #{result}."
  #   game.player_2_turns += 1
  # end

end
