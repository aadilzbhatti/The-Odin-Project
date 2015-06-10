class Node
	attr_reader :value, :left, :right
	def initialize(left, right, value)
		@left = left
		@right = right
		@value = value
	end

	def to_s
		"#{self.value} => {#{self.left.to_s}, #{self.right.to_s}}".gsub(' {, }', ' *')
	end
	def breadth_first_search(value)
		q = [self]
		while not q.empty?
			node = q.shift
			puts node
			return node if node.value == value
			if not node.left.nil?
				q << node.left
			end
			if not node.right.nil?
				q << node.right
			end
		end
		print 'nil'
		return nil
	end

	def depth_first_search(value)
		s = [self]
		while not s.empty?
			node = s.pop
			return node if node.value == value
			s << node.left if not node.left.nil?
			s << node.right if not node.right.nil?
		end
		print 'nil'
		return nil
	end

	def depth_first_search_rec(value, node = self)
		return node if node.value == value
		return nil if node.nil?
		if not node.left.nil?
			depth_first_search_rec(value, node.left)
		end
		if not node.right.nil?
			depth_first_search_rec(value, node.right)
		end
	end

	def self.build_tree(arr)
		return Node.new(nil, nil, arr[0]) if arr.length == 1
		return nil if arr.empty?

		mid = arr.length / 2
		mid_val = arr[mid]
	
		left = []
		right = []

		arr.each do |i|
			if i < mid_val
				left << i
			elsif i > mid_val
				right << i
			end
		end
		return Node.new(build_tree(left), build_tree(right), mid_val)
	end
end

arr = [1, 2, 3, 4, 5, 6]
tree = Node.build_tree(arr)

# puts tree # 4 => {2 => {1 => *, 3 => *}, 6 => {5 => *, *}}
# puts tree.breadth_first_search(5) # 5 => *
# puts tree.depth_first_search(6) # 6 => {5 => *, *}
# puts tree.depth_first_search_rec(6) # 6 => {5 => *, *}