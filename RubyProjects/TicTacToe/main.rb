require_relative 'player'
require_relative 'game'

def game_play(arr)
  Game.display_board(arr)
  Game.present_choices
end



game_arr = [['*', '*', '*'], ['*', '*', '*'], ['*', '*', '*']]


puts 'Welcome to command line Tic-Tac-Toe!'

first_input = Game.between_1_and_10('In order to see who goes first, one player please enter a number between 1 and 10.')
second_input = Game.between_1_and_10('Now the second player please enter a number between 1 and 10.')

guessed = rand(10)+1
diff1 = (guessed - first_input).abs
diff2 = (guessed - second_input).abs

puts diff1 < diff2 ? "The person who entered #{first_input} will be using X's (player 1) and the person\
 who entered #{second_input} will be using O's (player 2)." : "The person who entered #{second_input} will\
 be using X's (player 1) and the person who entered #{first_input} will be using O's (player 2)."

Player1 = Player.new('X', 'Player 1')
Player2 = Player.new('O', 'Player 2')

loop do
  game_play(game_arr)
  Player1.make_choice(game_arr)
  if Player1.check_victory(game_arr)
    puts 'Player 1 has won the game!'
    victory = true
    Game.display_board(game_arr)
    break
  end
  if Player1.check_tie(game_arr)
    puts 'It\'s a tie!'
    break
  end
  game_play(game_arr)
  Player2.make_choice(game_arr)
  if Player2.check_victory(game_arr)
    puts 'Player 2 has won the game!'
    victory = true
    Game.display_board(game_arr)
    break
  end
  if Player2.check_tie(game_arr)
    puts 'It\'s a tie!'
    break
  end
end
