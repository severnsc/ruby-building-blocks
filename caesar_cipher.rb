def caesar_cipher(string, shift)
	alphabet = ('a'..'z').to_a
	letters = string.split("")
    	letters.collect! do |letter|
		if /[A-Za-z]/.match(letter) != nil
			index = alphabet.index(letter.downcase)
			if /[A-Z]/.match(letter) != nil
				letter = alphabet[index-shift].upcase
			else
				letter = alphabet[index-shift]
			end
        	else
          		letter
		end
	end
        word = letters.join
	puts word
end
caesar_cipher("Years ago, I asked fabled direct marketer Joe Sugarman about the money-back guarantee he offered on the stuff he sold through magazine ads. He said 10% of the people who bought asked for their money back... and if any product dipped below 10%, he'd make the claims more outrageous until it got back up. He told me that this was a sweet spot, somewhere between amazing people with promises and disappointing them with reality.

That's one path.

The other path is the insurance company that points out that 99% of its customers would recommend them--after filing a claim. Imagine that standard: dealing with the emotions and financial impact of an insurance claim, knowing that you need to maintain a 99% delight standard.

That's the other path.

You can't do both. Either you dazzle with as much hype as you can get away with, or you invest in delighting people, regardless of how difficult it is.",11)
