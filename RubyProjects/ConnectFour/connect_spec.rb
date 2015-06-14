require_relative 'connect'

describe Connect do
	describe '.board_below_clear' do
		it 'should tell if the column is completely clear' do
			game_arr = [['*', '*', '*', '*'], 
			['*', '*', '*', '*'], 
			['*', '*', '*', '*'], 
			['*', 'A', '*', '*']]
			expect(Connect.board_below_clear(game_arr, 2)).to be true
			expect(Connect.board_below_clear(game_arr, 1)).to be false
		end
	end

	describe '.board_below_full' do
		it 'should tell if the column is completely full' do
			game_arr = [['*', '*', '*', '*'], 
			['A', '*', '*', '*'], 
			['B', '*', '*', 'B'], 
			['C', '*', '*', 'C']]
			expect(Connect.board_below_full(game_arr, 0, 0)).to be true
			expect(Connect.board_below_full(game_arr, 0, 3)).to be false
			expect(Connect.board_below_full(game_arr, 1, 3)).to be true
		end
	end

	describe '.update_board' do
		context 'when piece is in last row of board' do
			it 'it should place the piece there' do
				game_arr = [['*', '*', '*', '*'], 
				['*', '*', '*', '*'], 
				['*', '*', '*', '*'], 
				['*', '*', '*', '*']]
				shape = "\u26AA"
				Connect.update_board('Player 1', game_arr, 0)
				expect(game_arr).to eq([
				['*', '*', '*', '*'], 
				['*', '*', '*', '*'], 
				['*', '*', '*', '*'], 
				[shape, '*', '*', '*']])
			end
		end	

		context 'when piece is not in last row of board' do
			context 'when there are pieces in the bottom row' do
				it 'it should fall on top of that piece' do
					shape = "\u26AA"
					game_arr = [['*', '*', '*', '*'], 
					['*', '*', '*', '*'], 
					['*', '*', '*', '*'], 
					[shape, '*', '*', '*']]
					Connect.update_board('Player 1', game_arr, 0)
					expect(game_arr).to eq([
					['*', '*', '*', '*'], 
					['*', '*', '*', '*'], 
					[shape, '*', '*', '*'], 
					[shape, '*', '*', '*']])
				end
			end
		end
	end

	describe '.check_victory' do
		context 'when there are 4 in a row' do
			it 'it should win the game' do
				game_arr = [['*', '*', '*', '*'], 
					['*', '*', '*', '*'], 
					['*', '*', '*', '*'], 
					['X', 'X', 'X', 'X']]
				expect(Connect.check_victory(game_arr)).to be true
			end
		end

		context 'when there are 4 in a column' do
			it 'it should win the game' do
				game_arr = [['X', '*', '*', '*'], 
					['X', '*', '*', '*'], 
					['X', '*', '*', '*'], 
					['X', '*', '*', '*']]
				expect(Connect.check_victory(game_arr)).to be true
			end
		end

		context 'when there are 4 in a diagonal' do
			context 'and the diagonal is from right to left' do
				it 'it should win the game' do
					game_arr = 
						[['*', '*', '*', 'X'], 
						['*', '*', 'X', '*'], 
						['*', 'X', '*', '*'], 
						['X', '*', '*', '*']]
					expect(Connect.check_victory(game_arr)).to be true
				end
			end
			context 'and the diagonal is from left to right' do
				it 'it should win the game' do
					game_arr = 
						[['X', '*', '*', '*'], 
						['*', 'X', '*', '*'], 
						['*', '*', 'X', '*'], 
						['*', '*', '*', 'X']]
					expect(Connect.check_victory(game_arr)).to be true
				end
			end
		end
	end

	describe '.check_tie' do
		context 'when the board is filled' do
			it 'it should be a tie' do
				game_arr = [['A', 'B', 'B', 'A'], 
				['B', 'A', 'A', 'B'], 
				['A', 'B', 'B', 'A'], 
				['B', 'A', 'A', 'B']]
				expect(Connect.check_tie(game_arr)).to be true
			end
			context 'and there is a winning move' do
				it 'it should not be a tie' do
					game_arr = [['A', 'A', 'A', 'A'], 
					['B', 'A', 'A', 'B'], 
					['A', 'B', 'B', 'A'], 
					['B', 'A', 'A', 'B']]
					expect(Connect.check_tie(game_arr)).to be false
					expect(Connect.check_victory(game_arr)).to be true
				end
			end
		end	
	end
end