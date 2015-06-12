require 'spec_helper'

describe '.three_in_row' do
	before (:all) do 
		@player = Player.new('X', 'player')
	end

	context 'when three in row' do
		it 'it should win the game' do
			arr = [['X', 'X', 'X'], ['*', '*', '*'], ['*', '*', '*']]
			expect(@player.check_victory(arr)).to be true
		end
	end

	context 'when not three in row' do
		it 'it should not win the game' do
			arr = [['X', 'X', 'O'], ['*', '*', '*'], ['*', '*', '*']]
			expect(@player.check_victory(arr)).to be false
		end
	end
end

describe '.three_in_col' do
	before (:all) do
		@player = Player.new('X', 'player')
	end

	context 'when three in col' do
		it 'it should win the game' do
			arr = [['X', 'X', 'O'], ['X', '*', '*'], ['X', '*', '*']]
			expect(@player.check_victory(arr)).to be true
		end
	end

	context 'when not three in col' do
		it 'it should lose the game' do
			arr = [['X', 'X', 'O'], ['X', '*', '*'], ['O', '*', '*']]
			expect(@player.check_victory(arr)).to be false
		end
	end
end

describe '.three_in_diag' do
	before (:all) do
		@player = Player.new('X', 'player')
	end

	context 'when three in diagonal' do
		it 'it should win the game' do
			arr1 = [['X', 'O', 'O'], ['*', 'X', '*'], ['*', '*', 'X']]
			arr2 = [['*', '*', 'X'], ['*', 'X', '*'], ['X', '*', '*']]
			expect(@player.check_victory(arr1)).to be true
			expect(@player.check_victory(arr2)).to be true
		end
	end

	context 'when not three in diagonal' do
		it 'should not win the game' do
			arr = [['X', 'O', 'O'], ['*', 'X', '*'], ['*', '*', 'O']]
			expect(@player.check_victory(arr)).to be false
		end
	end
end

describe '.board_filled' do
	before (:all) do
		@player = Player.new('X', 'player')
	end

	context 'when the board is filled' do
		it 'it should win the game' do
			arr = [['X', 'O', 'O'], ['O', 'X', 'X'], ['X', 'X', 'O']]
			expect(@player.check_tie(arr)).to be true
		end
	end

	context 'when the board is not filled' do
		it 'it should lose the game' do
			arr = [['X', '*', 'O'], ['O', '*', 'O'], ['O', '*', 'X']]
			expect(@player.check_tie(arr)).to be false
		end
	end
end

describe '.place_shape' do
	it 'places a shape' do
		arr = ['*', '*', '*']
		Game.place_shape(arr, 'X', 0, 0)
		expect(arr).to eq(['X', '*', '*'])
	end
end
