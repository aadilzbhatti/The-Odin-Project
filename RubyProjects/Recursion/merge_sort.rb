def merge_sort(arr)
	if arr.length<=1
		return arr
	end
	left = []
	right = []
	mid = arr.length / 2
	for i in 0...mid
		left << arr[i]
	end
	for i in mid...arr.length
		right << arr[i]
	end
	left = merge_sort(left)
	right = merge_sort(right)
	return merge(left, right)
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