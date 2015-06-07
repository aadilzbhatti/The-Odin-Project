require 'socket'
require 'json'

host = 'localhost'
port = 2000

puts 'What type of request would you like to send? [GET, POST]'
input = gets.chomp.upcase

if input == 'POST'
	path = "/thanks.html"
	puts 'What is the name of your viking?'
	name = gets.chomp
	puts 'What is the email of your viking?'
	email = gets.chomp
	hash = {:viking => {:name=>name, :email=>email}}.to_json
	request = "POST #{path} HTTP/1.0\r\nFrom: #{email}\r\nUser-Agent: SimpleBrowser\r\nContent-type: application/json\r\nContent-Length: #{hash.to_s.length}\r\n\r\n#{hash}"
else
	path = "/index.html"
	request = "GET #{path} HTTP/1.0\r\n\r\n"
end

socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read
headers, body = response.split("\r\n\r\n", 2)
print headers
print body