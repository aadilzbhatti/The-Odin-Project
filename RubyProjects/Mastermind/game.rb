class Game
  attr_accessor :code, :colors, :guess_code

  def initialize
    @colors = %w{R G B Y M C}
    @code = ''
    @guess_code = '****'
    self.set_code
  end

  def set_code
    4.times do
      @code += @colors[rand(6)].to_s
    end
  end

  def show_incomplete
    puts 'The code now looks like this:'
    puts @guess_code
  end

  def check_guess(guess)
    guess == @code
  end

  def respond_to_guess(guess)
    res = ''
    guess_arr = guess.split(//)
    code_arr = @code.split(//)
    guess_arr.length.times do |i|
      if guess_arr[i] == code_arr[i]
        res += '#'
      elsif ((code_arr[i..code_arr.length-1].include?guess_arr[i]) || (code_arr[0..i-1].include?guess_arr[i])) && (i > res.length)
          res += '$'
      end
    end
  "The computer has responded with: #{res}"
  end

  def input_response(guess)

  end
end


