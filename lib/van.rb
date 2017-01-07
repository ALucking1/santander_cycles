class Van

  DEFAULT_CAPACITY = 20

  attr_reader :broken_bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @broken_bikes = []
  end

end
