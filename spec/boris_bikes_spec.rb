require 'boris_bikes'
require "pry"
RSpec.describe DockingStation do
	it 'releases a bike' do
		bike = Bike.new
		DockingStation.new.dock(bike)
		expect(DockingStation.new).to respond_to(:release_bike)
  end
	it 'gets a working bike' do
    bike = Bike.new
		expect(bike.working?).to eq true
	end
  it "docks a bike" do
		expect(DockingStation.new).to respond_to(:dock)
end
  it "raises an error when station is empty" do
		station = DockingStation.new
		expect{station.release_bike}.to raise_error "sorry station is empty"
end
  it "rases an error when dock is full" do
    station = DockingStation.new
		subject.capacity.times{station.dock(Bike.new)}
		expect{station.dock("bike")}.to raise_error "dock is full"
  end
  it 'sets docking capacity to 20' do
expect(subject.capacity).to eq (DockingStation::DEFAULT_CAPACITY)
end
end
RSpec.describe Bike do
  it "creates instance of a bike class" do
  	expect(Bike.new).to respond_to(:working?)
	end
end
