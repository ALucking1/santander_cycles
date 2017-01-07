require_relative 'bike'
require_relative 'van'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity, :working_bikes, :van, :broken_bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @working_bikes = []
    @van = Van.new
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

  def collect_broken_bikes
    @bikes.each do |bike|
      if bike.broken == true
      @van.broken_bikes << @bikes.delete(bike)
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
