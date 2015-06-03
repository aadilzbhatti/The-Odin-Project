class Game
  attr_accessor :code, :colors

  def initialize
    @colors = %w{R G B Y M C}
    @code = ""
    self.set_code
  end

  def set_code
    6.times do
      @code += @colors[rand(6)].to_s
    end
  end
end


