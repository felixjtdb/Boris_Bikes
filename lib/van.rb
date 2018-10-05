require 'pry'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def take(station)
    # @bikes = station.bikes.select { |bike| !bike.working?}
    # station.bikes.delete_if { |bike|  !bike.working? }
  end


end
