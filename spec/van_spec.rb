require 'van'
require 'docking_station'
require 'bike'

describe Van do

  let(:bike) {Bike.new}
  let(:van) {Van.new}
  let(:ds) {DockingStation.new}

  describe 'capacity' do
    it 'allows the user to set capacity for the van' do
      van = Van.new(10)
      expect(van.capacity).to eq(10)
    end

    it 'sets a default capacity if no capacity is given' do
      expect(van.capacity).to eq(20)
    end
  end

  describe '#collect_broken_bikes' do
    it 'takes broken bikes from the docking station' do
      bike.report_broken
      ds.dock(bike)
      ds.find_broken_bikes
      bikes = ds.broken_bikes
      van.collect_broken_bikes(*bikes)
      expect(van.collected_bikes).to include(bike)
    end
  end
end
