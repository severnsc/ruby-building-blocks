class Player

	def initialize
		puts "What's your name?"
		@name = gets.chomp
	end

	def guess_letter
		puts "#{@name}, guess a letter"
		@guess = gets.chomp.downcase
		while @guess.length != 1 && @guess != "save"
			puts "Invalid input! Try again."
			@guess = gets.chomp.downcase
		end
		@guess
	end

end