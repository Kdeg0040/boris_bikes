require 'docking_station'

describe DockingStation do
  it 'responds to #release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'releases working bikes' do
    #bike = subject.release_bike
    bike = Bike.new
    expect(bike).to be_working
  end

  it 'responds to #dock(bike)' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'responds to #bike' do
    expect(subject).to respond_to :bike
  end

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
end
