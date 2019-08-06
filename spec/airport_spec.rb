require 'airport'

RSpec.describe Airport do
  let(:airport) { described_class.new(20) }

  describe "#land" do
    it "instructs plane to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end
  end

  describe "#takeoff" do
    it "instructs plane to take-off" do
      expect(airport).to respond_to(:takeoff).with(1).argument
    end
  end

  it "does not allow landing when at capacity" do
    plane = double :plane
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full" 
  end
end