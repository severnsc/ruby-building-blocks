require_relative "./player.rb"
require_relative "./board.rb"

class Game
	attr_reader :board, :players, :current_player

	def initialize
		@player1 = Player.new
		@player2 = Player.new
		@player1.set_color("⚫")
		@player2.set_color("⚪")
		@players = [@player1, @player2]
		@current_player = @players[rand(0..1)]
		@board = Board.new
	end

	def play_turn(move)
		until @board.x_values.include?(move)
			puts "That's not a valid selection! Choose again."
			move = gets.chomp.upcase
		end
		until @board.spaces[move + "1"] == "O"
			puts "That column is full! Choose a different column."
			move = gets.chomp.upcase
		end
		squares_to_check = []
		@board.y_values.each {|y| squares_to_check.push(move+y.to_s)}
		move = squares_to_check.pop
		until @board.spaces[move] == "O" || squares_to_check.empty?
			move = squares_to_check.pop
		end
		@board.spaces[move] = @current_player.color
		@board.display
		@current_player == @player1 ? @current_player = @player2 : @current_player = @player1 unless game_over?	
	end

	def game_over?
		over = false
		x_horz_win = [@board.x_values[0..3], @board.x_values[1..4], @board.x_values[2..5], @board.x_values[3..6]]
		#Horzontal win check
		@board.y_values.each do |y|
			x_horz_win.each do |x_slice|
				if x_slice.all? {|x| @board.spaces[x + y.to_s] == "⚫"}
					puts "#{@player1.name} wins!"
					@board = Board.new
					over = true
				elsif x_slice.all? {|x| @board.spaces[x + y.to_s] == "⚪"}
					puts "#{@player2.name} wins!"
					@board = Board.new
					over = true
				end
			end
		end
		#Vertical win check
		y_vert_win = [@board.y_values[0..3], @board.y_values[1..4], @board.y_values[2..5]]
		@board.x_values.each do |x|
			y_vert_win.each do |y_slice|
				if y_slice.all? {|y| @board.spaces[x + y.to_s] == "⚫"}
					puts "#{@player1.name} wins!"
					@board = Board.new
					over = true
				elsif y_slice.all? {|y| @board.spaces[x + y.to_s] == "⚪"}
					puts "#{@player2.name} wins!"
					@board = Board.new
					over = true
				end
			end
		end
		#Diagonal win check
		y_diag_values = [@board.y_values[0..3], @board.y_values[1..4], @board.y_values[2..5]]
		x_diag_values = [@board.x_values[0..3], @board.x_values[1..4], @board.x_values[2..5], @board.x_values[3..6]]
		x_diag_values.each do |x_values|
			y_diag_values.each do |y_values|
				win_combo = []
				reverse_win_combo = []
				x_diag_values.length.times do |i|
					win_combo.push(x_values[i] + y_values[i].to_s)
				end
				x_diag_values.length.times do |i|
					reverse_win_combo.push(x_values[i] + y_values[(i+1)*-1].to_s)
				end
				if win_combo.all? {|sq| @board.spaces[sq] == "⚫"} || reverse_win_combo.all? {|sq| @board.spaces[sq] == "⚫"}
					puts "#{@player1.name} wins!"
					@board = Board.new
					over = true
				elsif win_combo.all? {|sq| @board.spaces[sq] == "⚪"} || reverse_win_combo.all? {|sq| @board.spaces[sq] == "⚪"}
					puts "#{@player2.name} wins!"
					@board = Board.new
					over = true
				end
			end
		end
		return over
	end

end