class Board
	
	def initialize
		colors = ["red", "green", "blue", "orange", "white", "yellow"]
		@master_row = []
		4.times {@master_row.push(colors[rand(6)])}
		@master_colors = Hash.new{0}
		@master_row.each {|color| @master_colors[color] += 1}
	end

	def feedback(guess)
		@correct = Hash.new(0)
		@feedback = ["","","",""]
		guess.each_with_index do |g, index|
			if g == @master_row[index]
				@feedback[index] = "X"
				@correct[g] += 1
			end
		end
		guess.each_with_index do |g, index|
			if @feedback[index] != "X"
				@correct[g] < @master_colors[g] ? @feedback[index] = "O" : @feedback[index] = "Wrong"
			end
		end
		puts "\n"
		@feedback.each {|f| puts f}
		@correct.values.inject(0) {|sum, i| sum + i}
	end
end