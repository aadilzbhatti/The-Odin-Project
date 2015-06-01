require "bubble"

array = [4,3,78,2,0,2]
s_array = ["hi", "I", "am", "pleased", "to", "know"]

describe "the bubble sort should" do
	it "sort an array of integers" do
		bubble_sort(array).should == [0,2,2,3,4,78]
	end
	it "sort an array of integers with block given" do
		bubble_sort_by(array) {|left, right| left - right}.should == [0,2,2,3,4,78]
	end
	it "sort an array of strings with block given" do
		bubble_sort_by(s_array) {|left, right| left.length - right.length}.should == ["I", "hi", "am", "to", "know", "pleased"]
	end
end