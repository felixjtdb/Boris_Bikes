
class DockingStation
  def release_bike
    fail "sorry station is empty" if @bike == nil
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end

  attr_reader :bike

end

class Bike
  def working?
    true
  end
end

# docking_station = DockingStation.new
# docking_station.release_bike
