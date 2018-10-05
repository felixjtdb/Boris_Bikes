require 'van'
require 'docking_station'
require 'bike'

describe Van do
  describe "#take" do
    it {is_expected.to respond_to(:take)}
    it "takes a broken bike from docking station" do
      van = Van.new
      station = DockingStation.new
      bike = Bike.new
      bike.report_broken
      station.dock(bike)
      van.take(station)
      expect(van.bikes).to eq([bike])
    end
    it "takes 2 broken bikes from docking station" do
      van = Van.new
      station = DockingStation.new
      bike = Bike.new
      bike.report_broken
      station.dock(bike)
      bike1 = Bike.new
      bike1.report_broken
      station.dock(bike1)
      van.take(station)
      expect(van.bikes).to eq([bike, bike1])
    end
    it "takes only broken bikes from dock" do
      van = Van.new
      station = DockingStation.new
      bike = Bike.new
      bike.report_broken
      station.dock(bike)
      bike1 = Bike.new
      bike1.report_broken
      station.dock(bike1)
      van.take(station)
      expect(van.bikes).to eq([bike, bike1])
    end
    it "Docking Station has broken bikes removed from docks" do
      van = Van.new
      station = DockingStation.new
      bike = Bike.new
      bike.report_broken
      station.dock(bike)
      van.take(station)
      expect(station.bikes).to eq([])
    end
  end
end
