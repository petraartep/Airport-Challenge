require 'airport'

RSpec.describe Airport do
  let(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe "#land" do
    context "when not stormy" do
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
    end

    context "when stormy" do
      it "raises an error when stormy" do
        # stubbing out randomness
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
      end
    end


  describe "#takeoff" do
    it "instructs plane to take-off" do
      expect(airport).to respond_to(:takeoff).with(1).argument
    end
  end





end

  
