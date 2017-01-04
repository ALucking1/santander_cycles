require 'docking_station'
require 'bike'

describe DockingStation do

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.dock(bike)).to eq(bike)
    end

    it 'releases working bikes' do
      bike = Bike.new
      subject.release_bike
      expect(bike).to be_working
    end

    it 'should not release a bike when none are available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock(bike)' do
    it 'should dock a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq(bike)
    end
  end

end
