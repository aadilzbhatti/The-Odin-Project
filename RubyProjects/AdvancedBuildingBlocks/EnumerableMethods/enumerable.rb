module Enumerable
	def my_each
		return self unless block_given?
		for i in self
			yield(i)
		end
	end

	def my_each_with_index
		return self unless block_given?
		for i in 0...length
			yield(i, self[i])
		end
	end

	def my_select
		return self unless block_given?
		newArray = []
		self.my_each {|i| newArray << i if yield(i)}
		newArray
	end

	def my_all?
		return self unless block_given?
		return self.my_select{|i| i if yield(i)} == self
	end

	def my_any?
		return self unless block_given?
		return self.my_select{|i| i if yield(i)}.size > 0
	end

	def my_none?
		return self unless block_given?
		return self.my_select{|i| i if not yield(i)} == self
	end

	def my_count(elm=nil)
		if elm.nil? and not block_given?
			return self.size
		elsif block_given?
			counter = 0
			self.my_each{|i| counter += 1 if yield(i)}
			return counter
		else
			counter = 0
			self.my_each{|i| counter += 1 if i == elm}
			return counter
		end
	end

	def my_map
		return self unless block_given?
		arr = []
		self.my_each{|i| arr << yield(i)}
		return arr
	end

	def my_inject(num=nil)
		return self unless block_given?
		accumulator = num.nil? ? first : num
		self.my_each {|i| accumulator = yield(accumulator, i)}
		accumulator
	end

	def multiply_els
		return self.my_inject(1) {|product, i| product * i}
	end

	def my_map_w_proc(proc)
		arr = []
		if proc and block_given?
			self.my_each{|i| arr << proc.call(yield(i))}
		elsif proc and not block_given?
			self.my_each{|i| arr << proc.call(i)}
		end
		return arr
	end
end