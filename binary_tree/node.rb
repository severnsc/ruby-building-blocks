class Node
	attr_accessor :parent, :left_child, :right_child, :value

	def initialize
		parent = nil
		left_child = nil
		right_child = nil
		value = nil
	end

end

def build_tree(array)
	a = array.dup
	root = Node.new
	root.left_child = Node.new
	root.right_child = Node.new
	root.left_child.value = array.delete(array.min)
	root.right_child.value = array.delete(array.max)
	#Whittle down the array to get the median
	until a.length <= 2
		a.delete(a.min)
		a.delete(a.max)
	end
	#If there's only one value, that's the median
	if a.length == 1
		root.value = a[0]
		array.delete(root.value)
	#Otherwise just select the largest value as median
	else
		root.value = a.max
		array.delete(root.value)
	end
	until array.length == 0
		min = array.delete(array.min)
		max = array.delete(array.max)
		if root.left_child.left_child && root.left_child.right_child.nil?
			root.left_child.right_child = Node.new
			root.left_child.right_child.value = min
		else
			new_leaf = Node.new
			new_leaf.value = min
			new_leaf.left_child = root.left_child
			root.left_child = new_leaf
		end
		if max.nil?
			root
		elsif root.right_child.right_child && root.right_child.left_child.nil?
			root.right_child.left_child = Node.new
			root.right_child.left_child.value = max
		else
			new_leaf = Node.new
			new_leaf.value = max
			new_leaf.right_child = root.right_child
			root.right_child = new_leaf
		end
	end
	root
end

def breadth_first_search(value, root)
	current_nodes = []
	found_node = nil
	if root.value == value
		found_node = root
	else
		current_nodes.push(root.left_child) unless root.left_child.nil?
		current_nodes.push(root.right_child) unless root.right_child.nil?
	end
	i=0
	until found_node || current_nodes.empty? || i>current_nodes.length-1
		found_node = breadth_first_search(value, current_nodes[i])
		i+=1
	end
	found_node
end

def depth_first_search(value, root)
	nodes_to_search = [root]
	found_node = nil
	#Discover Left side of tree
	current_node = root
	while current_node.left_child
		current_node = current_node.left_child
		nodes_to_search.push(current_node)
	end
	#Search left side of tree using Inorder
	until found_node || nodes_to_search.empty?
		current_node = nodes_to_search.pop
		if current_node.left_child && current_node.left_child.value == value
			found_node = current_node.left_child
		elsif current_node.value == value
			found_node = current_node
		elsif current_node.right_child && current_node.right_child.value == value
			found_node = current_node.right_child
		elsif current_node.right_child
			nodes_to_search.push(current_node.right_child)
		end
	end
	found_node
end

def dfs_rec(value, root)
	found_node = nil
	found_node = dfs_rec(value, root.left_child) if root.left_child
	return found_node if found_node
	return root if root.value == value
	found_node = dfs_rec(value, root.right_child) if root.right_child
	found_node
end