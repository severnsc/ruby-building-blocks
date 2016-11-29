require_relative "../board.rb"

describe Board do

	context "when board is created" do

		it "should contain 42 spaces" do
			expect(Board.new.spaces.count).to eql(42) 
		end

		it "should be a 7x6 grid" do
			expect(Board.new.x_values.count).to eql(7)
			expect(Board.new.y_values.count).to eql(6)
		end

		it "should have a hash of spaces" do
			expect(Board.new.spaces).to be_a(Hash)
		end

		it "should be empty" do
			expect(Board.new.spaces.values.all? {|v| v=="O"}).to eql(true)
		end

		it "should respond to display method" do
			expect(Board.new).to respond_to(:display)
		end

	end

	describe ".display" do
		before(:all) do
			@board = Board.new
		end
		it "should print a graphical display of the board" do
			expect{@board.display}.to output.to_stdout
		end
	end

end