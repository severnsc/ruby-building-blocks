def crack_cipher cipher
	start = Time.now
	alphabet = ("a".."z").to_a
	characters_in_cipher = cipher.downcase.split("")
	a_swaps = []
	i_swaps = []
	i=0
	i_shift = 0
	while i_shift == 0
		if i==0
			if characters_in_cipher[1] == " "
				i_shift = alphabet.index(characters_in_cipher[i]) - 8
				a_shift = alphabet.index(characters_in_cipher[i])
			end
		elsif characters_in_cipher[i-1] == " " && characters_in_cipher[i+1] == " "
			i_shift = alphabet.index(characters_in_cipher[i])-8
			a_shift = alphabet.index(characters_in_cipher[i])
		elsif i == characters_in_cipher.length-1
			if characters_in_cipher[-2] == " "
				i_shift = alphabet.index(characters_in_cipher[i])-8
				a_shift = alphabet.index(characters_in_cipher[i])
			end
		end
		i+=1
	end
	puts i_shift
	puts a_shift
	j = 0
	characters_in_cipher.each do |character|
		if /[a-z]/.match(character) != nil
			i_sub = alphabet.index(character)-i_shift
			i_swaps.push(alphabet[i_sub])
			a_sub = alphabet.index(character)-a_shift
			a_swaps.push(alphabet[a_sub])
		else
			i_swaps.push(character)
			a_swaps.push(character)
		end
		j+=1
	end
	puts i_swaps.join("")
	puts a_swaps.join("")
	end_time = Time.now
	puts "Operation took #{end_time-start} seconds"
end
crack_cipher "Bt bnhtau pcs X"