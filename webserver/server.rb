require 'socket'

server = TCPServer.open(2000)
loop{
	Thread.start(server.accept) do |client|
		request = client.read_nonblock(256)
		request_parts = request.split(" ")
		request_bulk,request_json = request.split("\r\n\r\n",2)
		verb = request_parts[0]
		if verb == "GET"
			if File.exists?(request_parts[1])
				response_body = File.read(request_parts[1])
				puts "HTTP/1.0 200 OK\r\nContent-type:text/html File-size: #{response_body.size}\r\n\r\n"
				client.puts "HTTP/1.0 200 OK\r\nContent-type:text/html File-size: #{response_body.size}\r\n\r\n"
				client.puts response_body
			else
				puts "HTTP/1.0 404 Not Found \r\n\r\n"
				client.puts "HTTP/1.0 404 Not Found \r\n\r\n"
				client.puts "404 Error, File not found"
			end
		else
			if File.exists?(request_parts[1])
				params = JSON.parse(request_json)
				response_body = File.read(request_parts[1])
				user_data = "<li>name: #{params['viking']['name']}</li><li><email: #{params['viking']['email']}/li>"
				client.puts "HTTP/1.0 200 OK \r\n\r\n"
				client.puts response_body.gsub('<%= yield %>', user_data)
			else
				puts "HTTP/1.0 404 Not Found \r\n\r\n"
				client.puts "HTTP/1.0 404 Not Found \r\n\r\n"
				client.puts "404 Error,File not Found"
			end
		end
		client.close
	end
}