require_relative 'player'

class Game
  def self.between_1_and_10(string)
    input = -1
    while input < 1 || input > 10
      puts string
      input = gets.chomp.to_i
    end
    input
  end

  def self.display_board(arr)
    counter = 0
    puts 'The board now looks like this:'
    arr.each do |sub|
      sub_counter = 0
      sub.each do |i|
        if sub_counter == 2
          puts i
        else
          print i.to_s + ' | '
          sub_counter += 1
        end
      end
      puts '---------' if counter != 2
      counter += 1
    end
  end

  def self.present_choices
    puts 'Enter:
          \'UL\' for Upper Left corner,
          \'UC\' for Upper Center,
          \'UR\' for Upper Right corner,
          \'CL\' for Center Left,
          \'CC\' for Center,
          \'CR\' for Center Right,
          \'BL\' for Bottom Left corner,
          \'BC\' for Bottom Center, and
          \'BR\' for Bottom Right corner.'
  end

  def self.place_shape(arr, shape, x, y)
    arr[x][y] = shape
  end
end
