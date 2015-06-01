require "enumerable"
array = [1, 2, 3, 4, 5]
describe "the enumerable methods" do
	it "can loop through each array value" do
		b = []
		array.my_each {|i| b << i}.should == [1, 2, 3, 4, 5]
	end

	it "can give each array element as well as the index" do
		b = {}
		array.my_each_with_index {|i, j| b[i] = j}
		b.should == {0 => 1, 1 => 2, 2 => 3, 3 => 4, 4 => 5}
	end

	it "can select certain elements based on a condition" do
		array.my_select {|i| i > 2}.should == [3, 4, 5]
	end

	it "can determine if all elements satisfy a condition" do
		array.my_all? {|i| i > 0}.should == true
		array.my_all? {|i| i > 2}.should == false
	end

	it "can determine if any elements satisfy a condition" do
		array.my_any? {|i| i > 2}.should == true
		array.my_any? {|i| i > 0}.should == true
	end

	it "can determine if none of the elements satisify a condition" do
		array.my_none? {|i| i < 0}.should == true
		array.my_none? {|i| i > 3}.should == false
	end

	it "can count the number of elements in the total array, number of certain elements, and number of elements based on a condition" do
		array.my_count.should == 5
		array.my_count(2).should == 1
		array.my_count {|i| i > 2}.should == 3
	end

	it "can change all of the values in an array" do
		array.map {|i| i * 5}.should == [5, 10, 15, 20, 25]
	end

	it "can retrieve one value from an array by multiplying all the elements" do
		array.multiply_els.should == 5 * 4 * 3 * 2 * 1
	end

	it "can map with a proc" do
		change = Proc.new {|i| i*5}
		array.my_map_w_proc(change).should == [5, 10, 15, 20, 25]
		array.my_map_w_proc(change) {|x| x * 2}.should == [10, 20, 30, 40, 50]
	end
end