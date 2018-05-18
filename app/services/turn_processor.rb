class TurnProcessor
  def initialize(game, target)
    @game   = game
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

  def winner
    if player_1_loss?
      'player_2'
    else
      'player_1'
    end
  end

  private

  attr_reader :game, :target

  def attack_opponent
    if game.current_turn == 'computer'
      result = Shooter.fire!(board: opponent.board, target: target)
    else
      result = Shooter.fire!(board: player.board, target: target)
    end
    game.cycle_turn

    if player_1_loss? || player_2_loss?
      go = 'Game over.'
      game.winner = @winner_email
    end

    @messages << "Your shot resulted in a #{result}."
    @messages <<  go if go


    game.player_1_turns += 1
  end


  def player_1_loss?
    @winner_email = game.player_2.email
    game.p1_board.board.flatten.map{|x| x.flatten[1]}.map(&:contents).compact.map(&:is_sunk?).select{|x| x == true}.size >= 5
  end

  def player_2_loss?
    @winner_email = game.player_1.email
    game.p2_board.board.flatten.map{|x| x.flatten[1]}.map(&:contents).compact.map(&:is_sunk?).select{|x| x == true}.size >= 5
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
