class RowSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send
  attributes :name, :data

  def name
    # produces text that says: "row_a" or whatever
    row_letter = object.first.keys.first.first.downcase
    ["row", row_letter].join("_")
  end

  def data
    object.map do |space_data|
      # space_data is a hash of the space {"A1"=>#<Space:0x00007ff7eac08890 @contents=nil, @coordinates="A1", @status="Not Attacked">}
      
      #space_data.values.first is the object itself
      # space serializer produces a hash: {:coordinates=>"A1", :status=>"Not Attacked"}
      SpaceSerializer.new(space_data.values.first).attributes
    end
  end
end
