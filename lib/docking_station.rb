require_relative 'bike'

class DockingStation

  attr_reader :bike

  # def initialize(capacity=1)
  #   @capacity = capacity
  # end

  def dock(bike)
    fail 'Docking station is at capacity' if @bike
    @bike = bike
  end

  def release_bike
    fail 'No bikes available' unless @bike
    @bike
  end

end
