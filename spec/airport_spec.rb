require 'airport'

RSpec.describe Airport do
  let(:airport) { described_class.new }

  describe "#land" do
    it "instructs plane to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end
  end

end