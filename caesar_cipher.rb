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
caesar_cipher("Me myself and I",11)
