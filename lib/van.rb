class Van

  DEFAULT_CAPACITY = 20

  attr_reader :broken_bikes, :capacity, :collected_bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @collected_bikes = []
  end

  def collect_broken_bikes(*bikes)
    @collected_bikes << bikes
  end

end
