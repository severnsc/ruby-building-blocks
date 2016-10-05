def crack_caesar_cipher cipher
	alphabet = ("a".."z").to_a
	i = 1
	while i<26
		letters = cipher.downcase.split("")
		letters.collect! do |letter|
			if letter != " "
				index = alphabet.index(letter)
				letter = alphabet[index-i]
			else
			letter = " "
			end
		end
		puts letters.join
		i+=1
	end
end
crack_caesar_cipher "Udgthrdgt pcs htktc ntpgh pvd"