
class Node
		attr_accessor :value, :parent, :left, :right
	
		def initialize(value)
			@value = value
			@parent = nil
			@left = nil
			@right = nil
		end
end


class BinaryTree

	# Build Tree #
	def initialize
		@root = nil
	end
	
	def build_tree(array)
		array.shuffle!
		@root = Node.new(array.shift)

		array.each do |x|
			insert_node(x)
		end	
			
	end


	def insert_node(value, node=@root)
		if value < node.value 
			if node.left == nil
				node.left = Node.new(value)
				node.left.parent = node
			else
				insert_node(value, node.left)
			end		
		end	
		if value >= node.value 
			if node.right == nil
				node.right = Node.new(value)
				node.right.parent = node
			else
				insert_node(value, node.right)
			end		
		end		
	end

	#Traverse and search tree #

	def breadth_first_search(value)
		queue = [@root]
		search_queue(queue, value)
	end

	def search_queue(queue, value)
		if queue.size == 0 
			puts "Value not in tree"
			return nil
		else	
			node = queue.shift #take first element out
			compare = node.value <=> value
				case compare
				when 0	
					puts "Value present in tree"
					return node
				when 1 
					queue<<node.left if node.left
					search_queue(queue, value)
				when -1
					queue<<node.right if node.right
					search_queue(queue, value)
						
			end	
		end
	end

	def depth_first_search(target) 
		stack = [@root]
			loop do
				break if stack.empty?
				node = stack.shift
				return node if node.value == target 
				stack.unshift node.left if node.left
				stack.unshift node.right if node.right
			end	
			puts "value not in this tree"
			return
	end

	def dfs_rec(target, node = @root)
		return nil if node == nil
		return node if node.value == target

		if node.value > target
			dfs_rec(target, node.left)
		else
			dfs_rec(target, node.right)
		end
	end



end

	


test = BinaryTree.new
test.build_tree([10,5,15,54,3,2,55,3,12,9,76])
puts test.inspect
puts test.breadth_first_search(3)
puts test.dfs_rec(3)
