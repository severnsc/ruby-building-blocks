require 'open-uri'

url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
File.open("hamlet.txt", "w"){|file| file.write(open(url).read)}
file = File.open("hamlet.txt", "r")
until file.eof?
	file.readlines.each_with_index do |line, idx|
		puts line if idx % 42 == 41
	end
end