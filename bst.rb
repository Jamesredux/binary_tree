
class Node
		attr_accessor :value, :left, :right
	
		def initialize(value)
			@value = value
			@parent = nil
			@left = nil
			@right = nil
		end
end


class BinaryTree

	def initialize
		@root = nil
	end
	
	def build_tree(array, parent=nil)
		return nil if array == nil || array.size == 0

		last = array.size - 1
		mid_val = array.size/2
					
		if @root == nil
			@root = Node.new(array[mid_val])
				unless last == 0
					@root.left = build_tree(array[0..mid_val-1], @root)
					@root.right = build_tree(array[mid_val+1..last])
				end
		else	
			node = Node.new(array[mid_val])
				unless last == 0
					node.left = build_tree(array[0..mid_val-1])
					node.right = build_tree(array[mid_val+1..last])
				end	
			return node
		end
	end

	
end

test = BinaryTree.new
test.build_tree([1,2,3,4,5,6,7,8,9,10])
puts test.inspect