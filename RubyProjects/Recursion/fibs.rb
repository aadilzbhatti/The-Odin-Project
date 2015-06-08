def fibs(n)
	t1 = 0
	t2 = 1
	sum = 0
	puts t1
	puts t2
	for i in 1...n
		sum = t2 + t1
		t1 = t2
		t2 = sum
		puts sum
	end
end

def fibs_rec(n)
	return 0 if n == 0
	return 1 if n == 1
	return fibs_rec(n-1) + fibs_rec(n-2) if n > 1
end

curr = Time.now
fibs(15)
puts Time.now - curr

curr = Time.now
puts fibs_rec(15)
puts Time.now - curr