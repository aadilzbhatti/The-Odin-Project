class Node
	attr_reader :value, :left, :right
	
	def initialize(left, right, value)
		@left = left
		@right = right
		@value = value
	end

	def to_s
		"#{self.value} => {#{self.left.to_s}, #{self.right.to_s}}".gsub(', }', ', *}')
	end

	def breadth_first_search(value)
		q = [self]
		while not q.empty?
			node = q.shift
			puts node
			return true if node.value == value
			q << node.left if not node.left == '*'
			q << node.right if not node.right == '*'
		end
		return false
	end

	def depth_first_search(value)
		s = [self]
		while not s.empty?
			node = s.pop
			puts node
			return true if node.value == value
			s << node.left if not node.left == '*'
			s << node.right if not node.right == '*'
		end
		return false
	end

	def depth_first_search_rec(value, node = self)
		return node if node.value == value
		return nil if node.nil?
		depth_first_search_rec(value, node.left) if not node.left.nil?
		depth_first_search_rec(value, node.right) if not node.right.nil?
	end

	def self.build_tree(arr)
		return Node.new('*', '*', arr[0]) if arr.length == 1
		return nil if arr.empty?
		mid = arr[arr.length / 2]
		left = []
		right = []
		arr.each do |i|
			if i < mid
				left << i
			elsif i > mid
				right << i
			end
		end
		return Node.new(build_tree(left), build_tree(right), mid)
	end
end

# puts tree = Node.build_tree([1, 2, 3, 4, 5, 6, 7]) # 4 => {2 => {1 => {*, *}, 3 => {*, *}}, 6 => {5 => {*, *}, 7 => {*, *}}}
# puts tree.breadth_first_search(12) # => false
# puts tree.depth_first_search(6) # => true
# puts tree.depth_first_search_rec(6) # => true