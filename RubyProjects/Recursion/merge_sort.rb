def merge_sort(arr)
	return arr if arr.length<=1
	mid = arr.length / 2
	left = arr[0...mid]
	right = arr[mid...arr.length]
	left = merge_sort(left)
	right = merge_sort(right)
	merge(left, right)
end

def merge(left, right)
	res = []
	while (not left.empty?) && (not right.empty?)
		if left.first <= right.first
			res << left.first
			left.shift
		else
			res << right.first
			right.shift
		end
	end
	while not left.empty?
		res << left.first
		left.shift
	end
	while not right.empty?
		res << right.first
		right.shift
	end
	res
end

p merge_sort([9, 3, 4, 2, 1, 3, 9, 10])