class InvalidMove < StandardError
  def initialize(msg = "Invalid attack.")
    super(msg)
  end
end
