require_relative 'game'
require_relative 'control'

puts 'Welcome to command-line Mastermind!'
puts 'Your objective is to guess the four-color code created by the AI.
Each turn, you will input a four-color code to try and crack the AI\'s code.
If you guess both a correct color and position, a \'#\' will be shown. If you
guess the correct color but the wrong position, a \'$\' will be shown. The order
of the symbols does not matter. It is your job to determine the correct order and
colors in the code. Have fun!'

main = Game.new
player = Control.new
victory = false

puts main.code
while player.guesses > 0 do
  puts "There are #{player.guesses} guesses left."
  guess = player.make_guess
  if main.check_guess(guess)
    puts 'You have guessed the code correctly!'
    victory = true
    puts main.code
    break
  else
    puts main.respond_to_guess(guess)
    player.decrement_guesses
  end
end

if victory == false
  puts 'You have exceeded the amount of allowed guesses.'
  puts "The code was: #{main.code}"
end