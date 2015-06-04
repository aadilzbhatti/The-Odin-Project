require_relative 'game'
require_relative 'control'
require_relative 'computer'

def player_generated_code
  main = Game.new
  player = Control.new
  computer = Computer.new
  victory = false

  while computer.guesses > 0 do
    guess = computer.guess_code
    puts guess
    if main.check_guess(guess)
      puts "The computer has guessed the correct code in #{computer.guesses}"
      victory = true
      break
    else
      response = computer.input_response(guess)
      computer.read_response(response)
      computer.decrement_guesses
    end
  end

  if victory == false
    puts 'The computer has exceeded the amount of allowed guesses.'
    puts "The code was: #{computer.code}"
  end
end

def computer_generated_code
  main = Game.new
  player = Control.new
  victory = false

  while player.guesses > 0 do
    puts "There are #{player.guesses} guesses left."
    guess = player.make_guess
    if main.check_guess(guess)
      puts 'You have guessed the code correctly!'
      victory = true
      break
    else
      puts "The computer has responded with: #{main.respond_to_guess(guess)}"
      player.decrement_guesses
    end
  end

  if victory == false
    puts 'You have exceeded the amount of allowed guesses.'
  end
  puts "The code was: #{main.code}"
end

puts 'Welcome to command-line Mastermind!'

puts 'Your objective is to guess the four-color code created by the AI. The
represented colors are Red(R), Green(G), Blue(B), Yellow(Y), Magenta(M), and Cyan(C).
Each turn, you will input a four-color code (in the form \'RGYB\') to try and crack the AI\'s code.
If you guess both a correct color and position, a \'#\' will be shown. If you
guess a correct color but the wrong position, a \'$\' will be shown. The order
of the symbols does not matter. It is your job to determine the correct order and
colors in the code.

In addition to this, you can have the computer try and guess a RGBYMC-type code of
your own. Have fun!'

puts 'Type \'A\' if you would like to guess a computer-generated code. Type \'B\' if you
would like the computer to guess YOUR code.'
input = gets.chomp.upcase

case input
  when 'A'
    computer_generated_code
  when 'B'
    player_generated_code
  else
    puts 'I don\'t know that choice!'
end

