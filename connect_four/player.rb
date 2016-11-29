class Player
	attr_accessor :name
	attr_reader :color

	def initialize
		puts "What's your name?"
		@name = gets.chomp
		puts "Hello #{@name}!"
	end

	def set_color(color)
		@color = color
	end

end