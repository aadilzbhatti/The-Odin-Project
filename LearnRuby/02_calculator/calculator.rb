def add(p1, p2)
	p1 + p2
end

def subtract(p1, p2)
	p1 - p2
end

def sum(arr)
	n = arr.length
	sum = 0
	n.times do |i|
		sum += arr[i]
	end
	return sum
end

def multiply(p1, p2)
	prod = p1 * p2
	return prod
end

def product(arr)
	n = arr.length
	prod = 1
	n.times do |i|
		prod *= arr[i]
	end
	return prod
end

def power(p1, p2)
	p1**p2
end

def factorial(n)
	if n == 0
		return 1
	else
		return n * factorial(n - 1)
	end
end
