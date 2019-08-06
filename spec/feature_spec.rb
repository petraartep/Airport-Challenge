RSpec.describe "User Stories" do
  let(:airport) { Airport.new(20) }
  let(:plane) { Plane.new }

  # As an air traffic controller
  # So planes can land safely at my airport
  # I would like to instruct a plane to land
  context "when weather is not stormy" do  
    before do
      allow(airport).to receive(:stormy?).and_return false
    end

    it "instructs a plane to land" do
      expect { airport.land(plane) }.not_to raise_error
    end

  # As an air traffic controller
  # So planes can take off safely from my airport
  # I would like to instruct a plane to take off
    it "instructs a plane to take off" do
      expect { airport.takeoff(plane) }.not_to raise_error 
    end

    # As an air traffic controller
    # So that I can avoid collisions
    # I want to prevent airplanes landing when my airport is full
    context "when airport is full" do
      it "prevents planes landing" do
        allow(airport).to receive(:stormy?).and_return false
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full" 
      end 
    end
  end

  # As an air traffic controller
  # So that I can avoid accidents
  # I want to prevent airplanes landing or taking off when the weather is stormy
  context "when weather is stormy" do  
    before do
      allow(airport).to receive(:stormy?).and_return true
    end

    it "does not allow planes to land" do
      expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
    end

    it "does not allow planes to take off" do
      expect { airport.takeoff(plane) }.to raise_error "Cannot take-off plane: weather is stormy"
    end
  end


# As an air traffic controller
# So that I can ensure safe take off procedures
# I want planes only to take off from the airport they are at

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

# As an air traffic controller
# So the system is consistent and correctly reports plane status and location
# I want to ensure a flying plane cannot take off and cannot be in an airport

# As an air traffic controller
# So the system is consistent and correctly reports plane status and location
# I want to ensure a plane that is not flying cannot land and must be in an airport

# As an air traffic controller
# So the system is consistent and correctly reports plane status and location
# I want to ensure a plane that has taken off from an airport is no longer in that airport
end