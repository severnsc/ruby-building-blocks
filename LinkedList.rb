require "./Node.rb"

class LinkedList
	attr_accessor :name
	attr_reader :head, :tail

	#Creates a new LinkedList object
	def initialize
		@head = nil
		@tail = nil
	end

	#Adds a node to the end of the LinkedList
	def append(node)
		@head.nil? ? (@head, @tail = node, node) : (@tail.next, @tail = node, node)
	end

	#Adds a node to the front of a LinkedList
	def prepend(node)
		@head.nil? ? (@head, @tail = node, node) : (node.next, @head = @head, node)
	end

	#Returns the number of nodes contained in the LinkedList
	def size
		if @head.nil?
			0
		else
			i = 1
			current_node = @head
			until current_node.next.nil?
				i+=1
				current_node = current_node.next
			end
			i
		end
	end

	#Returns the node at the given index
	def at(index)
		i = 0
		current_node = @head
		until i == index
			current_node = current_node.next
			i+=1
		end
		current_node
	end

	#Removes the last node from the LinkedList
	def pop
		current_node = @head
		size = self.size
		case size
		when 0
			nil
		when 1
			deleted = @head
			@head, @tail = nil, nil
			deleted
		when 2
			deleted = @tail
			@head.next = nil
			@tail = @head
			deleted
		else
			deleted = @tail
			current_node = current_node.next until current_node.next == @tail
			current_node.next = nil
			@tail = current_node
			deleted
		end
	end

	#Returns true if the given value is within the LinkedList, returns false otherwise
	def contains?(value)
		current_node = @head
		found = false
		current_node.value == value ? found = true : current_node = current_node.next until found || current_node.nil?
		found
	end

	#Returns the index of the node containing given data, nil if it's not found
	def find(data)
		i = 0
		current_node = @head
		found = false
		current_node.value == data ? found = true : (current_node, i = current_node.next, i+1) until found || current_node.nil?
		found ? i : nil
	end

	#Converts the LinkedList into a string and returns it. Format (data) -> (data) -> nil
	def to_s
		current_node = @head
		string = ""
		until current_node.nil?
			string += "(#{current_node.value}) -> "
			current_node = current_node.next
		end
		string += "nil"
		string
	end

	#Inserts the data into the node at the given index. Overwrites old value property
	def insert_at(data, index)
		i = 0
		current_node = @head
		current_node = current_node.next until i == index
		current_node.value = data
		current_node.value
	end

	#Inserts given node at the given index
	def insert_node_at(node, index)
		i = 0
		current_node = @head
		if index == 0
			node.next = @head.next
			@head = node
		else
			current_node, i = current_node.next, i+1 until i == index - 1
			node.next = current_node.next
			current_node.next = node
			self.to_s
		end
	end

	#Removes the node at the given index
	def remove_at(index)
		if index == 0
			@head = @head.next
		elsif index == self.size - 1
			self.pop
		else
			i = 0
			current_node = @head
			current_node, i = current_node.next, i+1 until i == index - 1
			node_to_be_deleted = current_node.next
			current_node.next = node_to_be_deleted.next
			node_to_be_deleted.next = nil
			self.to_s
		end
	end

end