class SpaceSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send
  attributes :coordinates, :status, :occupied?

  def coordinates
    object.coordinates
  end

  def status
    object.status
  end

#TODO Added to help with testing
  def occupied?
    object.occupied?
  end
end
