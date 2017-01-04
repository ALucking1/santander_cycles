require 'docking_station'
require 'bike'

describe DockingStation do

  describe '#release_bike' do
    it 'should not release a bike when none are available' do
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it 'releases working bikes' do
      ds = DockingStation.new
      bike = Bike.new
      ds.dock(bike)
      ds.release_bike
      expect(bike).to be_working
    end
  end

  describe '#dock(bike)' do
    it 'should dock a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end

    it 'should not dock a bike if at capacity' do
      20.times {subject.dock(Bike.new)}
      expect{subject.dock(Bike.new)}.to raise_error 'Docking station is at capacity'
    end
  end

end
