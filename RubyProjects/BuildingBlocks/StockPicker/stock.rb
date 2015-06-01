def stock_picker(arr)
	max = 0
	lo = hi = 0
	arr.length.times do |i|
		(arr.length - i).times do |j|
			if arr[i] < arr[i+j]
				if arr[i+j] - arr[i] > max
					max = arr[i+j] - arr[i]
					lo = i
					hi = j+1
				end
			end
		end
	end
	return "[#{lo}, #{hi}] for a profit of $#{max}"
end