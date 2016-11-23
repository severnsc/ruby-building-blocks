require_relative "../enumerable.rb"

describe Enumerable do
	
	describe ".my_each" do

		before(:all) do
			@array = [1,2,3]
			@plus_one = proc {|i| puts i+1}
		end

		context "given before" do
			it 'puts 2, 3 and 4' do
				expect{@array.my_each(&@plus_one)}.to output("2\n3\n4\n").to_stdout
			end
			it 'returns [1,2,3]' do
				expect(@array.my_each(&@plus_one)).to eql(@array)
			end
		end

		context "given []" do
			it "returns []" do
				expect([].my_each(&@plus_one)).to eql([])
			end
		end

		context "when not provided a block" do
			it 'raises an error' do
				expect{[1,2,3].my_each}.to raise_error(LocalJumpError)
			end
		end

		context "when not provided an enumerable" do
			it 'raises an error' do
				expect{1.my_each}.to raise_error(NoMethodError)
			end
		end

	end

	describe ".my_each_with_index" do

		before(:all) do
			@array = [1,2,3]
			@plus_index = proc {|i, index| puts i+index}
		end

		context "given before" do	
			it "puts 1, 3 and 5" do
				expect{@array.my_each_with_index(&@plus_index)}.to output("1\n3\n5\n").to_stdout
			end
			it "returns [1,2,3]" do
				expect(@array.my_each_with_index(&@plus_index)).to eql(@array)
			end
		end

		context "given []" do
			it "returns []" do
				expect([].my_each_with_index(&@plus_index)).to eql([])
			end
		end

		context "when not provided a block" do
			it "raises an error" do
				expect{@array.my_each_with_index}.to raise_error(LocalJumpError)
			end
		end

		context "when self is not an enumerable" do
			it "raises an error" do
				expect{1.my_each_with_index}.to raise_error(NoMethodError)
			end
		end

	end

	describe ".my_select" do

		before(:all) do
			@array = [1,2,3]
			@check = proc {|i| i%2!=0}
		end

		context "given before" do
			it "returns [1,3]" do
				expect(@array.my_select(&@check)).to eql([1,3])
			end
		end

		context "when no match" do
			it "returns []" do
				expect(@array.my_select{|i| i==100}).to eql([])
			end
		end

		context "when not given a block" do
			it "raises an error" do
				expect{@array.my_select}.to raise_error(LocalJumpError)
			end
		end

		context "when not given an enumerable" do
			it "raises and error" do
				expect{1.my_select}.to raise_error(NoMethodError)
			end
		end

	end

	describe ".my_all?" do

		before(:all) do
			@array = [1,2,3]
			@check = proc {|i| i.is_a? Integer}
		end

		context "given before" do
			it "returns true" do
				expect(@array.my_all?(&@check)).to eql(true)
			end
		end

		context "when block has no match" do
			it "returns false" do
				expect(@array.my_all? {|i| i>10000}).to eql(false)
			end
		end

		context "when block has all but one match" do
			it "returns false" do
				expect(@array.my_all? {|i| i%2!=0}).to eql(false)
			end
		end

		context "when not given a block" do
			it "returns true" do
				expect(@array.my_all?).to eql(true)
			end
		end

		context "when not given an enumerable" do
			it "raises and error" do
				expect{1.my_all?(&@check)}.to raise_error(NoMethodError)
			end
		end

	end

	describe ".my_any?" do

		before(:all) do
			@array = [1,2,3]
			@check = proc {|i| i == 1}
		end

		context "given before" do
			it "returns true" do
				expect(@array.my_any?(&@check)).to eql(true)
			end
		end

		context "when no match" do
			it "returns false" do
				expect(@array.my_any? {|a| a>1000}).to eql(false)
			end
		end

		context "when multiple matches" do
			it "returns true" do
				expect(@array.my_any?{|a| a.is_a?Integer}).to eql(true)
			end
		end

		context "when not given a block" do
			it "returns true" do
				expect(@array.my_any?).to eql(true)
			end
		end

		context "when not given an enumerable" do
			it "raises an error" do
				expect{1.my_any?(&@check)}.to raise_error(NoMethodError)
			end
		end

	end

	describe ".my_count" do

		before(:all) do
			@array = [1,2,3]
			@check = proc {|a| a%2==0}
		end

		context "given before" do
			it "returns 1" do
				expect(@array.my_count(&@check)).to eql(1)
			end
		end

		context "when all items match block" do
			it "returns length of the array" do
				expect(@array.my_count{|a| a.is_a? Integer}).to eql(3)
			end
		end

		context "when not given a block" do
			it "returns the length of the array" do
				expect(@array.my_count).to eql(3)
			end
		end

		context "when not given an enumerable" do
			it "raises an error" do
				expect{1.my_count}.to raise_error(NoMethodError)
			end
		end

	end

end