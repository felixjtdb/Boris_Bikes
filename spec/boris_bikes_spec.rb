require 'boris_bikes'
require "pry"
describe DockingStation do
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
		expect{station.dock(Bike.new)}.to raise_error "dock is full"
  end
  it 'sets docking capacity to 20' do
    expect(subject.capacity).to eq (DockingStation::DEFAULT_CAPACITY)
	end
	it 'bikes at station broken' do
		station = DockingStation.new
		bike = Bike.new
		bike.report_broken
		station.dock(bike)
		expect{station.release_bike}.to raise_error "sorry no working bikes"
	end
	it '1 broken bike and 1 working bike, releases working bike' do
		station = DockingStation.new
		broken_bike = Bike.new
		broken_bike.report_broken
		station.dock(broken_bike)
		working_bike = Bike.new
		station.dock(working_bike)
		expect(station.release_bike).to eq(working_bike)
  end
end
