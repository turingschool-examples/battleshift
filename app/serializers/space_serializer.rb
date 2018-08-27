class SpaceSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send
  attributes :coordinates, :status

  def coordinates
    binding.pry
    # "A1"
    object.coordinates
  end

  def status
    # "Not Attacked"
    object.status
  end
end
