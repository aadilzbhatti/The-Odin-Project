require_relative 'game'

class Control
  attr_accessor :guesses

  def initialize
    @guesses = 12
  end

  def decrement_guesses
    @guesses-=1
  end

  def make_guess
    loop do
      puts 'Enter your guess:'
      guess = gets.chomp.upcase
      if guess.length != 4 || guess.split(//).include?(1..9)
        puts 'Guesses must be 4 characters long'
      else
        return guess
      end
    end
  end
end