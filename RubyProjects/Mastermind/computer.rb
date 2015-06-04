class Computer
  attr_accessor :guesses, :code

  def initialize
    @guesses = 12
    @code = get_player_code
  end

  def get_player_code
    loop do
      puts 'Enter a code for the computer to guess:'
      input = gets.chomp.upcase
      if input.length != 4 || input.split(//).any? {|x| not %w{R G B Y M C}.include?x}
        puts 'Code must be 4 non-numeric characters long and must represent 4 of the 6 allowed colors(RGBYMC).'
      else
        return input
      end
    end
  end

  def guess_code
    color_arr = %w{R G B Y M C}
    guess = ''
    4.times do
      guess += color_arr[rand(6)].to_s
    end
    guess
  end

  def input_response(guess)
    puts "The computer has guessed: #{guess}"
    loop do
      puts 'What is your response?'
      input = gets.chomp
      if input.length > 4 || input.split(//).any? {|x| not %w{# $}.include?x}
        puts 'Code must be at most 4 characters and only contain \'#\' and \'$\' characters.'
      else
        return input
      end
    end
  end

  def read_response(response)

  end
end