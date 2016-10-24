require 'rubygems'
require 'open-uri'
require 'nokogiri'

page = Nokogiri::HTML(open("http://www.espn.com/nfl/player/gamelog/_/id/13982/julio-jones"))

data = page.css(".textright")
data.each do |d|
	file = File.open("julio.csv", "w")
	file.puts d.text + ","
end