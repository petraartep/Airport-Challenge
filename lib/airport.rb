class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport full' if @planes.length >= @capacity
    @planes << plane
  end

  def takeoff(plane)
  end

end