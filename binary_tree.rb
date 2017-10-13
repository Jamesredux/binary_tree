
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

	def breadth_search(value)
		queue = [@root]
		search_queue(queue, value)
	end

	def search_queue(queue, value)
		if queue.size == 0 
			puts "Value not in tree"
			return nil
		else	
			node = queue.shift #take first element out
			queue<<node.left unless node.left.nil? 
			queue<<node.right unless node.right.nil? 
				if node.value == value
					puts "Value present in tree"
					return node
				else
					search_queue(queue, value)	
				end	
		end
	end


end

	


test = BinaryTree.new
test.build_tree([8,6,10,7,3,12,17,1,9,22,88,14,5,76,33])
puts test.inspect
puts test.breadth_search(7)