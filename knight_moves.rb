require "./Graph.rb"

class ChessBoard

	@@x_axis = (1..8).to_a
	@@y_axis = (1..8).to_a

	def x_axis
		@@x_axis
	end

	def y_axis
		@@y_axis
	end

end

class Knight
	attr_reader :visited

	def initialize
		@board = ChessBoard.new
	end

	def set_position(x_coord, y_coord)
		if @board.x_axis.include?(x_coord) && @board.y_axis.include?(y_coord)
			@x_coord = x_coord
			@y_coord = y_coord
			puts "Knight to #{@x_coord}, #{@y_coord}"
		elsif !@board.x_axis.include?(x_coord)
			puts "Not a legal X coordinate!"
		elsif !@board.y_axis.include?(y_coord)
			puts "Not a legal Y coordinate!"
		end
	end

	def position
		@position = [@x_coord, @y_coord]
	end

	def legal_moves
		values_array = [[-2,-1],[-2,1],[-1,-2],[-1,2],[1,-2],[1,2],[2,-1],[2,1]]
		legal_moves_array = []
		values_array.each do |values|
			legal_moves_array.push([@x_coord+values[0],@y_coord+values[1]])
		end
		legal_moves_array.delete_if do |move|
			if move[0] < 1  || move[0] > 8 || move[1] < 1 || move[1] > 8
				true
			end
		end
		legal_moves_array
	end

	def knight_moves(start, finish)
		return "You're already there!" if start == finish
		@x_coord = start[0]
		@y_coord = start[1]
		child_squares = {}
		squares_to_check = self.legal_moves
		child_squares[start] = self.legal_moves
		if child_squares[start].include?(finish)
			[start, finish]
		else
			shortest_path = []
			current_square = start
			until child_squares.values.any? {|v| v.include?(finish)}
				child_squares[current_square].each do |square|
					@x_coord = square[0]
					@y_coord = square[1]
					child_squares[square] = self.legal_moves
					squares_to_check += self.legal_moves
				end
				current_square = squares_to_check.shift
			end
			finish_parent = child_squares.select {|k, v| v.include?(finish)}
			finish_parent_values = []
			finish_parent.each do |k,v|
				v.each do |a|
					finish_parent_values.push(a)
				end
			end
			current_square = finish_parent.keys[0]
			shortest_path += [current_square, finish]
			until current_square == start
				current_square_hash = child_squares.select {|k,v| v.include?(current_square)}
				current_square = current_square_hash.keys[0]
				shortest_path.unshift(current_square)
			end
			return "You got there in #{shortest_path.length} steps. Here's the path:\n #{shortest_path}"
		end
	end

end