class Connect
	def self.game_play(player)
		puts "It is now #{player}\'s turn."
		input = Connect.display_choices
	end

	def self.display_board(arr)
		counter = 0
    	puts 'The board now looks like this:'
    	arr.each do |sub|
      	sub_counter = 0
      	sub.each do |i|
        	if sub_counter == 3
	          puts i
    	    else
        	  print i.to_s + " \u2503 "
          	sub_counter += 1
        	end
      	end
      	puts "\u2501" * 13 if counter != 3
      	counter += 1
    	end	
	end

	def self.display_choices
		puts 'Enter a coordinate (0-3) to determine your board position.'
		y = -1
		while (y < 0 || y > 3)
			y = gets.chomp.to_i
			puts 'Invalid input. Please try again.' if y < 0 || y > 3 
		end
		y
	end

	def self.update_board(player, arr, y)
		shape = player == 'Player 1' ? "\u26AA" : "\u26AB"
		if board_below_clear(arr, y)
			arr[3][y] = shape
		else
			counter = 0
			counter += 1 while not board_below_full(arr, counter, y)
			arr[counter][y] = shape unless arr[counter][y] != '*'
		end
	end

	def self.board_below_clear(arr, pos)
		return arr[3][pos] == '*'
	end

	def self.board_below_full(arr, x, y)
		return arr[x+1][y] != '*'
	end

	def self.check_victory(arr)
		return true if four_in_row(arr)
		return true if four_in_col(arr)
		return true if four_in_diag(arr)
	end

	def self.check_tie(arr)
		return (board_filled(arr)) && (not check_victory(arr))
	end

	def self.four_in_row(arr)
		arr.each {|sub| return true if sub.uniq.length == 1 and not sub.include?'*'}
   		return false
	end

	def self.four_in_col(arr)
		4.times {|i| return true if (arr[0][i] == arr[1][i] && arr[1][i] == arr[2][i] && arr[2][i] == arr[3][i]) && (arr[0][i] != '*' && arr[1][i] != '*' &&  arr[2][i] != '*' && arr[3][i] != '*')}
    	return false
	end

	def self.four_in_diag(arr)
		left_diag  = [arr[0][0], arr[1][1], arr[2][2], arr[3][3]].uniq.length == 1
    	right_diag = [arr[3][0], arr[2][1], arr[1][2], arr[0][3]].uniq.length == 1
   		return (left_diag && arr[0][0] != '*') || (right_diag && arr[3][0] != '*')
	end

	def self.board_filled(arr)
    	flag = true
    	arr.each {|sub| flag = false if sub.any?{|x| x == '*'}}
    	return flag
 	end
end