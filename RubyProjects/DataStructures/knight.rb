$board_length = 7

def knight_moves(start, finish, checked=[]) # Finds the minimum path length from A to B
	p start
	return 'WE FOUND IT!!' if start == finish
	checked << start
	moves = det_moves(start).select {|x| not checked.include?x} 
	length = []
	moves.each {|i| length << path_length(i, finish)}
	move = moves[length.index(length.min)]
	knight_moves(move, finish, checked)
end

def path_length(start, finish, checked=[]) # Computes the length of every path from point A to point B
	return 0 if start == finish
	checked << start
	moves = det_moves(start).each {|i| return 1 if i == finish}
	moves.each {|i| return 1 + path_length(i, finish, checked) if not checked.include?i}
	return 0
end

def det_moves(start) # Determines possible moves for each coordinate
	x_init, y_init = start[0], start[1]

	move_x_1 = x_init + 1 > $board_length ? nil : x_init + 1
	move_x_2 = x_init + 2 > $board_length ? nil : x_init + 2
	move_x_3 = x_init - 1 < 0 ? nil : x_init - 1
	move_x_4 = x_init - 2 < 0 ? nil : x_init - 2
	move_y_1 = y_init + 2 > $board_length ? nil : y_init + 2
	move_y_2 = y_init + 1 > $board_length ? nil : y_init + 1
	move_y_3 = y_init - 1 < 0 ? nil : y_init - 1
	move_y_4 = y_init - 2 < 0 ? nil : y_init - 2

	move1 = [move_x_1, move_y_1]
	move2 = [move_x_3, move_y_4]
	move3 = [move_x_2, move_y_2]
	move4 = [move_x_4, move_y_3]
	move5 = [move_x_1, move_y_4]
	move6 = [move_x_3, move_y_1]
	move7 = [move_x_2, move_y_3]
	move8 = [move_x_4, move_y_2]

	moves = [move1, move2, move3, move4, move5, move6, move7, move8].select {|i| not i.include?nil}
end

p knight_moves([0, 0], [7, 7])