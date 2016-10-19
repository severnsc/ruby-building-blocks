require './Players'
require './Board'

class Game
	attr_accessor :game, :board

	def initialize
		@player = Player.new
		play_game
		return "Bye!"
	end

	def play_game
		@board = Board.new
		@guesses = 12
		@correct = 0
		until @guesses == 0 || @correct == 4
			play_turn
		end
		if @guesses == 0 && @correct != 4
			puts "Game over! You lose!"
			play_again?
		elsif @correct == 4
			puts "You got the code right! You win!"
			play_again?
		end
	end

	def play_turn
		puts "\nMake your guess of the Master Code. Separate colors with comma space. Colors: Red, Blue, Green, Yellow, White, Orange. Guesses left: #{@guesses}"
		@current_guess = @player.guess
		@guesses -= 1
		@correct = @board.feedback(@current_guess)
		puts "\n[X - Correct color in the correct spot; O - the color is in the Master code]"
	end

	def play_again?
		puts "Do you want to play again? Type Yes or No"
		@answer = gets.chomp.downcase
		if @answer == "yes"
			play_game
		end
	end

end
Game.new