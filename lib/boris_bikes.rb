
class DockingStation
  attr_reader :bikes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
  def release_bike
    fail "sorry station is empty" if empty?
    Bike.new
  end
  def empty?
    if @bikes.length == 0
      true
    else
      false
    end
  end
  def full?
    if @bikes.length == @capacity
      true
    else
      false
    end
  end
  def dock(bike)
    fail "dock is full" if full?
    @bikes << bike
  end

end

class Bike
  def working?
    true
  end
end

# docking_station = DockingStation.new
# docking_station.release_bike
