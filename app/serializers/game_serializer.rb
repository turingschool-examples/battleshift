class GameSerializer < ActiveModel::Serializer
  attributes :id, :message, :current_turn,
             :player_1_board, :player_2_board

  def player_1_board
    BoardSerializer.new(object.player_1.board).attributes
  end

  def player_2_board
    BoardSerializer.new(object.player_2.board).attributes
  end

  def message
    @instance_options[:message]
  end
end
