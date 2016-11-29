require_relative "../game.rb"
require_relative "../board.rb"

describe Game do
	
	describe ".initialize" do
		it "creates a board" do
			expect(Game.new).to respond_to(:board)
			expect(Game.new.board).to be_a(Board)
		end

		it "responds to the players method" do
			expect(Game.new).to respond_to(:players)
		end

		it "has two players" do
			expect(Game.new.players.count).to eql(2)
		end

		it "has selected which player should go first" do
			expect(Game.new.current_player).to be_a(Player)
		end

		it "should set the players colors" do
			expect(Game.new.players.any? {|p| p.color.nil?}).to eql(false)
		end

	end

	describe ".play_turn" do
		before(:all) do
			@game = Game.new
			@player1 = @game.instance_variable_get(:@player1)
			@player2 = @game.instance_variable_get(:@player2)
			@game.instance_variable_set(:@current_player, @player1)
			@move = "A"
			@game.instance_variable_set(:@move, @move)
			@current_player = @player1
			@board = @game.board
		end

		it "displays the board to the terminal" do
			expect{@game.play_turn("A")}.to output.to_stdout
		end

		context "when there's no pieces in the column" do
			before(:all) do
				@game.instance_variable_set(:@current_player, @player1)
			end
			it "places the current players piece into the column selected" do
				expect{@game.play_turn("A")}.to output.to_stdout
				expect(@board.spaces["A6"]).to eql("⚫")
			end
		end

		context "when there's already a piece in the column" do
			before(:all) do
				@board.spaces["A6"] = "⚫"
				@game.instance_variable_set(:@current_player, @player2)
			end
			it "places the current player's piece on top of the last piece" do
				expect{@game.play_turn("A")}.to output.to_stdout
				expect(@board.spaces["A5"]).to eql("⚪")
			end
		end

		it "changes the current player once the turn is taken" do
			@game.play_turn("A")
			expect(@game.instance_variable_get(:@current_player)).to eql(@player2)
		end

	end

	describe ".game_over?" do
		
		before do
			@game = Game.new
			@board = @game.board
			@player1 = @game.instance_variable_get(:@player1)
			@game.instance_variable_set(:@current_player, @player1)
		end

		context "when 4 in a row horizontal" do

			before do 
				horizontal_win_spaces = ["A6", "B6", "C6", "D6"]
				horizontal_win_spaces.each do |space|
					@board.spaces[space] = "⚫"
				end
			end

			it "declares the player with the 4 in a row the winner" do
				expect{@game.game_over?}.to output("#{@player1.name} wins!\n").to_stdout
			end

			it "creates a new board" do
				@game.game_over?
				expect(@game.board.spaces.values.all? {|v| v=="O" }).to eql(true)
			end
		end

		context "when 4 in a row vertical" do

			before do 
				vertical_win_spaces = ["A6", "A5", "A4", "A3"]
				vertical_win_spaces.each do |space|
					@board.spaces[space] = "⚫"
				end
			end

			it "declares the player with the 4 in a row the winner" do
				expect{@game.game_over?}.to output("#{@player1.name} wins!\n").to_stdout
			end

			it "creates a new board" do
				@game.game_over?
				expect(@game.board.spaces.values.all? {|v| v=="O" }).to eql(true)
			end
		end

		context "when 4 in a row diagonal" do

			before do
				diagonal_win_spaces = ["A6", "B5", "C4", "D3"]
				diagonal_win_spaces.each do |space|
					@board.spaces[space] = "⚫"
				end
			end

			it "declares the player with the 4 in a row the winner" do
				expect{@game.game_over?}.to output("#{@player1.name} wins!\n").to_stdout
			end

			it "creates a new board" do
				@game.game_over?
				expect(@game.board.spaces.values.all? {|v| v=="O" }).to eql(true)
			end
		end
	end

end