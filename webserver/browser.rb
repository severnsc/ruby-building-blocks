require 'socket'
require 'json'

host = "localhost"
port = 2000

puts "What HTTP method do you want to use, GET or POST?"
method = gets.chomp.upcase
until method == "GET" || method == "POST"
	puts "That is not a valid method. Please type GET or POST"
	method = gets.chomp.upcase
end
if method == "GET"
	puts "What path are you requesting?"
	path = gets.chomp
	request = "#{method} #{path} HTTP/1.0\r\n\r\n"
else
	puts "What is your viking's name?"
	name = gets.chomp
	puts "What is your viking's email?"
	email = gets.chomp
	viking = {:viking=> {:name => name, :email => email}}
	request = "#{method} thanks.html HTTP/1.0\r\nContent-Length: #{viking.to_json.length}\r\n\r\n#{viking.to_json}"
end
socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read
headers,body = response.split("\r\n\r\n", 2)
print body
socket.close