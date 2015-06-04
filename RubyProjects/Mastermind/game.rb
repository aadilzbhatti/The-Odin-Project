class Game
  attr_accessor :code, :colors

  def initialize
    @colors = %w{R G B Y M C}
    @code = ''
    self.set_code
  end

  def set_code
    i = 6
    4.times do
      val = rand(i)
      @code += @colors[val].to_s
      @colors.delete_at(val)
      i-=1
    end
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
      elsif code_arr.include?guess_arr[i]
        res += '$'
      end
    end
  res
  end

  def input_response(guess)

  end
end


