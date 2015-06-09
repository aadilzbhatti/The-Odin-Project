require_relative 'node'

board_length = 8

def knight_moves(start, finish)
	board = [[] * board_length] * board_length
	x_init = start[0]
	y_init = start[1]
	moves_arr = determine_positions(x_init, y_init)
	p moves_arr
	# game_tree = Node.build_tree(moves_arr)
end

def determine_positions(x_init, y_init)
	move_x_1 = x_init + 1 > board_length ? nil : x_init + 1
	move_x_2 = x_init + 2 > board_length ? nil : x_init + 2
	move_x_3 = x_init - 1 < board_length ? nil : x_init - 1
	move_x_4 = x_init - 2 < board_length ? nil : x_init - 2
	move_y_1 = y_init + 2 > board_length ? nil : y_init + 2
	move_y_2 = y_init + 1 > board_length ? nil : y_init + 1
	move_y_3 = y_init - 1 < board_length ? nil : y_init - 1
	move_y_4 = y_init - 2 < board_length ? nil : y_init - 2

	move1 = [move_x_1, move_y_1]
	move2 = [move_x_3, move_y_4]
	move3 = [move_x_2, move_y_1]
	move4 = [move_x_4, move_y_3]
	move5 = [move_x_1, move_y_4]
	move6 = [move_x_3, move_y_1]
	move7 = [move_x_2, move_y_3]
	move8 = [move_x_4, move_y_2]

	moves = [move1, move2, move3, move4, move5, move6, move7, move8]
	moves = moves.select do |i|
		not i.include?nil
	end
	moves
end

puts knight_moves([0, 0])