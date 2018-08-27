class BoardSerializer < ActiveModel::Serializer
  # TODO: alias for serializing POROs
  alias :read_attribute_for_serialization :send
  attributes :rows

  def rows
    object.board.map do |row|
      RowSerializer.new(row).attributes
    end
  end
end
