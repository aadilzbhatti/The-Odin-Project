require_relative 'game'

class Player
  attr_accessor :shape, :games_won, :choices
  def initialize(shape)
    @shape = shape
    @games_won = 0
    @choices = []
  end

  def make_choice(arr)
    choice = gets.chomp
    case choice.upcase
      when "UL"
        Game.place_shape(arr, @shape, 0, 0)
      when "UC"
        Game.place_shape(arr, @shape, 0, 1)
      when "UR"
        Game.place_shape(arr, @shape, 0, 2)
      when "CL"
        Game.place_shape(arr, @shape, 1, 0)
      when "CC"
        Game.place_shape(arr, @shape, 1, 1)
      when "CR"
        Game.place_shape(arr, @shape, 1, 2)
      when "BL"
        Game.place_shape(arr, @shape, 2, 0)
      when "BC"
        Game.place_shape(arr, @shape, 2, 1)
      when "BR"
        Game.place_shape(arr, @shape, 2, 2)
      else
        puts 'I don\'t know that choice!'
        make_choice(arr)
    end
    @choices << choice
    p @choices
    return choice
  end

  def check_victory
    if @choices.any? {|entry| entry == 'UL'} and @choices.any? {|entry| entry == 'UC'} and @choices.any? {|entry| entry == 'UR'}
      true
    end
  end
end