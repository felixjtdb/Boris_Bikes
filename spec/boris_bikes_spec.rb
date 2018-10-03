require 'boris_bikes'

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
end
RSpec.describe Bike do
  it "creates instance of a bike class" do
  	expect(Bike.new).to respond_to(:working?)
	end
end
