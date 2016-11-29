require_relative "../tic_tac_toe.rb"

require 'stringio'

module Kernel
  def capture_stdout(console_input = '')
    $stdin = StringIO.new(console_input)
    out = StringIO.new
    $stdout = out
    yield
    return out.string.strip
  ensure
    $stdout = STDOUT
    $stdin = STDIN
  end
end

describe TicTacToe do
	
	describe ".check_if_game_over" do

		context "when top row is 'XXX'" do

			it "puts Game over! {Player 1} wins!" do
				expect{game.check_if_game_over}.to output{"Game over! Name won!"}.to_stdout
			end
		end

	end

end