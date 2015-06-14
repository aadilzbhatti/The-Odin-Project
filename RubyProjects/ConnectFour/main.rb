require_relative 'connect.rb'

game_arr = [['*', '*', '*', '*'], ['*', '*', '*', '*'], ['*', '*', '*', '*'], ['*', '*', '*', '*']]

puts 'Welcome to command-line Connect Fur!'
puts "Player 1 will have the shape: \u26AA"
puts "Player 2 will have the shape: \u26AB"

counter = 0
loop do
	Connect.display_board(game_arr)
	player = counter % 2 == 0 ? 'Player 1': 'Player 2'
	input = Connect.game_play(player)
	Connect.update_board(player, game_arr, input)
	if Connect.check_victory(game_arr)
		puts "#{player} has won the game!"
		Connect.display_board(game_arr)
		break
	elsif Connect.check_tie(game_arr)
		puts 'It\'s a tie!'
		break
	end
	counter += 1
end