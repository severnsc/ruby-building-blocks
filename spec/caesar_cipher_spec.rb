require_relative "../caesar_cipher.rb"

describe CaesarCipher do

	describe ".caesar_cipher" do
	
		context "given ('','')" do
			it "equals ''" do
				expect(CaesarCipher.caesar_cipher('','')).to eql("")
			end
		end

		context "given ('', 1)" do
			it "returns ''" do
				expect(CaesarCipher.caesar_cipher('',1)).to eql('')
			end
		end

		context "given ('abc','1')" do
			it "raises and error" do
				expect{CaesarCipher.caesar_cipher('abc','1')}.to raise_error(TypeError)
			end
		end

		context "given ('bcd', 1)" do
			it "returns 'abc'" do
				expect(CaesarCipher.caesar_cipher("bcd",1)).to eql('abc')
			end
		end

	end

end