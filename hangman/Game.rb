require "./Player.rb"
require "yaml"
class Game

	def initialize
		@player = Player.new
		puts "Do you want to load a game? Type Yes or No"
		response = gets.chomp.downcase
		if response == "yes"
			saved_games = Dir["*.yaml"]
			saved_games.each {|game| puts game}
			puts "Type the filename without the extension of the saved game you want to load. (Filename is case sensitive)"
			file_name = gets.chomp
			if File.exist?("#{file_name}.yaml")
				@game = YAML.load(File.read("#{file_name}.yaml"))
				@game.play_game
			else
				puts "Sorry, that file doesn't exist!"
			end
		else
		setup_game
		end
	end

	def setup_game
		words = File.readlines "5desk.txt"
		@secret_word = words[rand(words.count)].chomp.downcase
		@secret_word = words[rand(words.count)].chomp.downcase while @secret_word.length < 5 || @secret_word.length > 12
		@guesses = 10
		@letters_guessed = []
		@letters = @secret_word.split("")
		@feedback = []
		@letters.each {|letter| @feedback.push("_")}
		play_game
		play_again?
	end

	def play_game
		while @guesses > 0 && @feedback.join != @secret_word
			puts "Guesses left: #{@guesses}"
			puts "Word:"
			@feedback.each {|f| print f}
			print "\n Letter guessed:"
			@letters_guessed.sort.each {|letter| print letter}
			puts "\n To save your game and exit type Save"
			@guess = @player.guess_letter
			while @letters_guessed.include?(@guess)
				puts "You already guessed that letter! Guess a different letter."
				@guess = @player.guess_letter
			end
			if @guess == "save"
				puts "What do you want to name your saved game?"
				@save_name = gets.chomp
				File.open("#{@save_name}.yaml", "w") {|file| file.puts self.to_yaml}
			else
				@letters_guessed.push(@guess)
				check_guess(@guess)
				update_hangman
			end
		end
		puts @guesses == 0 ? "Game over! You lose! The word was #{@secret_word}" : "You win!"
	end

	def check_guess(guess)
		@letters.include?(guess) ? @letters.each_with_index {|letter, index| @feedback[index] = guess if letter == guess} : @guesses -= 1
	end

	def play_again?
		puts "Do you want to play again? Type Yes or No"
		response = gets.chomp.downcase
		setup_game if response == "yes"
	end

	def update_hangman
		case @guesses
		when 10
			puts ""
		when 9
			puts "
				  O
			"
		when 8
			puts "
				  O
				  |
			"
		when 7
			puts "
				  O
				 /|
			"
		when 6
			puts "
				  O
				 /|\\ 
			"
		when 5
			puts "
				  O
				 /|\\
				 /
			"
		when 4
			puts "
				  O
				 /|\\
				 / \\
			"
		when 3
			puts "
			      |
			      O
			     /|\\
			     / \\
			"
		when 2
			puts "
				  ________
					  |
			   	          O
			                 /|\\
				         /\\
			"
		when 1
			puts "
				________
				|       |
				|       O
				|      /|\\
				|      /\\
			"
		else
			puts "
				________
				|       |
				|       O
				|      /|\\
				|____  /\\
			"
		end
	end

end