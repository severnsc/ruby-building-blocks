class TicTacToe
	attr_reader :player1, :player2

	def initialize
		print "Player 1, "
		@player1 = Player.new("X")
		print "Player 2, "
		@player2 = Player.new("O")
		play_game
	end

	private

	def play_game
		@board = Board.new
		players = [@player1, @player2]
		@current_player = players[rand(2)]
		@game_over = false
		until @game_over
			puts "It's #{@current_player.name}'s turn. Which square would you like to take?"
			square = gets.chomp
			until @board.squares[square.to_i].is_a? Integer
				puts "That's not a valid choice! Pick again."
				square = gets.chomp
			end
			@board.squares[square.to_i] = @current_player.symbol
			@board.show_board
			check_if_game_over
			@current_player == @player1 ? @current_player = @player2 : @current_player = @player1
		end
		puts "Do you want to play again? Enter Yes or No"
		play_again = gets.chomp
		play_game if play_again.downcase == "yes"
	end

	def check_if_game_over
		square_win_combos = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[7,5,3]]
		square_win_combos.each do |combo|
			letters = ""
			combo.each  {|sq| letters += @board.squares[sq].to_s}
			if letters == "XXX"
				@game_over = true
				puts "Game over! #{@player1.name} won!"
			elsif letters == "OOO"
				@game_over = true
				puts "Game over! #{player2.name} won!"
			end
		end
		if @board.squares.values.all? {|square| square.is_a? String} && @game_over == false
			@game_over = true
			puts "Game over! It's a draw!"
		end
	end

	class Player
		attr_reader :name, :symbol

		def initialize(symbol)
			puts "What is your name"
			@name = gets.chomp
			@symbol = symbol
			puts "Welcome #{@name}! Your symbol is #{@symbol}."
		end

	end

	class Board
		attr_accessor :squares

		def initialize
			@squares = {}
			9.times {|i| @squares[i+1] = i+1}
			show_board
		end

		def show_board
			puts "
			_#{@squares[1]}_|_#{@squares[2]}_|_#{@squares[3]}_
			_#{@squares[4]}_|_#{@squares[5]}_|_#{@squares[6]}_
			 #{@squares[7]} | #{@squares[8]} | #{@squares[9]} 
			"
		end

	end

end