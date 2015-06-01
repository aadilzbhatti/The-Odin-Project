require "stock"

describe "the stock picker" do 
	it "picks the optimum interval" do
		stock_picker([17,3,6,9,15,8,6,1,10]).should == "[1, 4] for a profit of $12"
		stock_picker([14, 1, 9, 17, 8]).should == "[1, 3] for a profit of $16"
	end
	it "picks an interval where the lowest day is the last day" do
		stock_picker([17,3,6,9,15,8,6,10,1]).should == "[1, 4] for a profit of $12"
	end
end