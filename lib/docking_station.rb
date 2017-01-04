require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail 'Docking station is at capacity' if docking_station_full?
    @bikes << bike
  end

  def release_bike
    fail 'No bikes available' if docking_station_empty?
    @bikes.pop
  end

  private

  def docking_station_full?
    @bikes.count >= 20
  end

  def docking_station_empty?
    @bikes.empty?
  end

end
