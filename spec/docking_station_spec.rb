require 'docking_station'
require "pry"

describe DockingStation do
	let(:bike_working)  { double(:bike, working?: true) }
	let(:bike_not_working)  { double(:bike, working?: false) }

	it 'sets docking capacity to 20' do
		expect(subject.capacity).to eq (DockingStation::DEFAULT_CAPACITY)
	end

	describe "#release_bike" do

		it 'releases a bike' do
			subject.dock(bike_working)
			expect(subject).to respond_to(:release_bike)
		end
		it "raises an error when subject is empty" do
			expect{subject.release_bike}.to raise_error "sorry station is empty"
		end
		it 'bikes at subject broken' do
			subject.dock(bike_not_working)
			expect{subject.release_bike}.to raise_error "sorry no working bikes"
		end
		it '1 broken bike and 1 working bike, releases working bike' do
			subject.dock(bike_working)
			subject.dock(bike_not_working)
			expect(subject.release_bike).to eq(bike_working)
		end
	end

	describe "#dock" do

		it "docks a bike" do
			expect(subject).to respond_to(:dock)
		end
		it "rases an error when dock is full" do
			subject.capacity.times{subject.dock(bike_working)}
			expect{subject.dock(bike_working)}.to raise_error "dock is full"
		end
	end
end
