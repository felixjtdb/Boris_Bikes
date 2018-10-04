require 'bike'
describe Bike do
  it "creates instance of a bike class" do
  	expect(Bike.new).to respond_to(:working?)
	end
	it "report bike is broken" do
		expect(Bike.new).to respond_to(:report_broken)
	end
	it "report_broken makes working? return false" do
	  bike = Bike.new
	  bike.report_broken
		expect(bike.working?).to eq(false)
  end
end
