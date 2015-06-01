def bubble_sort(array)
	n = array.length
	loop do
		swapped = false
		for i in 1..n-1 do
			if array[i-1] > array[i]
				array[i-1], array[i] = array[i], array[i-1]
				swapped = true
			end
		end
		break if not swapped
	end
	return array	
end

def bubble_sort_by(array)
	n = array.length
	loop do
		swapped = false
		for i in 1..n-1 do
			if yield(array[i-1], array[i]) > 0
				array[i-1], array[i] = array[i], array[i-1]
				swapped = true
			end
		end
		break if not swapped
	end
	return array
end