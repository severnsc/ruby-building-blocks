def substrings(string,dictionary)
	word_count = Hash.new(0)
	dictionary.each do |substring|
		if /#{substring}/.match(string.downcase) != nil
			letters = string.downcase.split("")
			i = 0
			while i < letters.count
				if /#{substring}/.match(letters[i..i+substring.length-1].join)
					word_count[substring] += 1
					i+=1
				else
					i+=1
				end
			end
		end
	end
	puts word_count
end
dictionary = dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?",dictionary)