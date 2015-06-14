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

  def self.three_in_row(arr)
    arr.each {|sub| return true if sub.uniq.length == 1 and not sub.include?'*'}
    return false
  end

  def self.three_in_col(arr)
    3.times {|i| return true if (arr[0][i] == arr[1][i] and arr[1][i] == arr[2][i]) && (arr[0][i] != '*' && arr[1][i] != '*' &&  arr[2][i] != '*')}
    return false
  end

  def self.three_in_diag(arr)
    left_diag = (arr[0][0] == arr[1][1] and arr[1][1] == arr[2][2])
    right_diag = (arr[0][2] == arr[1][1] and arr[1][1] == arr[2][0])
    center = arr[1][1]
    return (left_diag and center != '*') or (right_diag and center != '*')
  end

  def self.board_filled(arr)
    flag = true
    arr.each {|sub| flag = false if sub.any?{|x| x == '*'}}
    return flag
  end
end
