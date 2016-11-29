require_relative "../player.rb"
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

describe Player do
	
	context "when created" do

		let(:player) do
			capture_stdout("player1") {return Player.new}
		end

		it "should ask the user for their name" do
			expect{Player.new}.to output{"What's your name?"}.to_stdout
		end

		it "should respond to the name method" do
			expect(player).to respond_to(:name)
		end

		it "should respond to the color method" do
			expect(player).to respond_to(:color)
		end

	end

end