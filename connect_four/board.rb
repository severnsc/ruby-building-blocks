class Board
	attr_reader :spaces, :x_values, :y_values

	def initialize
		@spaces = Hash.new
		@x_values = ["A", "B", "C", "D", "E", "F", "G"]
		@y_values = [1,2,3,4,5,6]
		@y_values.each do |y|
			@x_values.each do |x|
				coordinate = x + y.to_s
				@spaces[coordinate] = "O"
			end
		end
		@spaces
	end

	def display
		puts "    A    B    C    D    E    F    G"
		i = 1
		j = 1
		spaces_array = @spaces.to_a
		while i <= @spaces.count
			if [1,8,15,22,29,36,43].include?(i)
				print "#{j}    "
				j+=1
			end
			print i%7 == 0 ? "#{spaces_array[i-1][1]}\n" : "#{spaces_array[i-1][1]}    "
			i+=1
		end
	end

end