require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    fail 'Docking station is at capacity' if docking_station_full?
    @bikes << bike
  end

  def release_bike
    fail 'No bikes available' if docking_station_empty?
    @working_bikes = []
    @bikes.each do |bike|
      if bike.broken == false
      @working_bikes << bike
      end
    end
    @working_bikes.pop
  end

  private

  def docking_station_full?
    @bikes.count >= @capacity
  end

  def docking_station_empty?
    @bikes.empty?
  end

end
