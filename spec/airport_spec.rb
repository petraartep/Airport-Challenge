require 'airport'

RSpec.describe Airport do
  let(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe "#land" do
    context "when weather is not stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "instructs plane to land" do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context "when full" do
        it "raises an error" do
          20.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full" 
        end
      end
    end

    context "when weather is stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return true
      end

      it "raises an error" do
        expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
      end
    end
  end


  describe "#takeoff" do
    context "when weather is not stormy" do
      it "instructs planes to take-off" do
        expect(airport).to respond_to(:takeoff).with(1).argument
      end
    end

    context "when weather is stromy" do
      before do 
        allow(airport).to receive(:stormy?).and_return true
      end

      it "raises an error" do
        expect { airport.takeoff(plane) }.to raise_error "Cannot take-off plane: weather is stormy"
      end
    end
  end
end
