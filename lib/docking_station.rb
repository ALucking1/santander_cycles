require_relative 'bike'
require_relative 'van'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity, :working_bikes, :broken_bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @working_bikes = []
    @broken_bikes = []
  end

  def dock(bike)
    fail 'Docking station is at capacity' if docking_station_full?
    @bikes << bike
  end

  def release_bike
    find_working_bikes
    fail 'No bikes available' if docking_station_empty?
    @working_bikes.pop
  end

  def find_broken_bikes
    @bikes.each do |bike|
      if bike.broken == true
      @broken_bikes << @bikes.delete(bike)
      end
    end
  end

  private

  def docking_station_full?
    @bikes.count >= @capacity
  end

  def docking_station_empty?
    @working_bikes.empty?
  end

  def find_working_bikes
    @bikes.each do |bike|
      if bike.broken == false
      @working_bikes << @bikes.delete(bike)
      end
    end
  end

end
