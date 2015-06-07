require 'socket'
require 'json'

server = TCPServer.open(2000)
loop do
	client = server.accept
	request = client.read_nonblock(256)
	header, body = request.split("\r\n\r\n", 2)
	req = header.split[0]
	file = header.split[1][1..-1]

	if File.exists?(file)
		f = File.read(file)
		client.print("HTTP/1.1 200 OK\nDate: #{Time.now.ctime}\nContent-Type: text/html\nContent-Length: #{file.size}\r\n\r\n")
		if req == 'GET'
			client.puts(f)
		elsif req == 'POST'
			params = JSON.parse(body)
			registration = "<li>Name: #{params["viking"]["name"]}</li><li>Email: #{params["viking"]["email"]}</li>"
			f = f.gsub("<%=yield%>", registration)
			client.puts(f)
		end
	else
		client.print "404 File Not Found\n"
	end
	client.puts 'Closing the connection. Bye!'
	client.close
end
