class Vertex
	attr_reader :value

	def initialize(value)
		@value = value
		@edges = []
	end

	def add_edge(vertex)
		@edges.push(vertex)
	end

	def edges
		@edges
	end

end