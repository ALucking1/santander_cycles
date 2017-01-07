require 'docking_station'
require 'bike'

describe DockingStation do

let(:bike) {double :bike}

  describe 'capacity' do
    it 'allows the user to set capacity for the docking station' do
      ds = DockingStation.new(10)
      expect(ds.capacity).to eq(10)
    end
  end

  describe '#release_bike' do
    it 'should not release a bike when none are available' do
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'releases working bikes' do
      allow(bike).to receive(:broken).and_return(false)
      subject.dock(bike)
      subject.release_bike
      expect(subject.bikes).not_to include(bike)
    end
  end

  describe '#dock(bike)' do
    it 'should dock a bike' do
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end

    it 'should not dock a bike if at capacity' do
      subject.capacity.times {subject.dock(bike)}
      expect{subject.dock(bike)}.to raise_error 'Docking station is at capacity'
    end

    xit 'should not release a bike if the bike is broken' do
      allow(bike).to receive(:broken).and_return(false)
      allow(bike).to receive(:report_broken).and_return(true)
      bike.report_broken
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  describe 'van' do
    it 'should collect broken bikes' do
    allow(bike).to receive(:broken).and_return(false)
    allow(bike).to receive(:report_broken).and_return(true)
    bike.report_broken
    subject.dock(bike)
    subject.collect_broken_bikes
    expect{subject.van}.to include(bike)
    end
  end

end
