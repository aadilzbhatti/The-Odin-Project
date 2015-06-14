require_relative 'game'

class Player
  attr_accessor :shape, :name
  def initialize(shape, name)
    @shape = shape
    @name = name
  end

  def make_choice(arr)
    choice = gets.chomp.upcase
    case choice
      when 'UL'
        if (arr[0][0] == '*')
          Game.place_shape(arr, @shape, 0, 0)
        else
          puts 'Spot is taken. Please make a different selection.'
          make_choice(arr)
        end
      when 'UC'
        if (arr[0][1] == '*')
          Game.place_shape(arr, @shape, 0, 1)
        else
          puts 'Spot is taken. Please make a different selection.'
          make_choice(arr)
        end
      when 'UR'
        if (arr[0][2] == '*')
          Game.place_shape(arr, @shape, 0, 2)
        else
          puts 'Spot is taken. Please make a different selection.'
          make_choice(arr)
        end
      when 'CL'
        if (arr[1][0] == '*')
          Game.place_shape(arr, @shape, 1, 0)
        else
          puts 'Spot is taken. Please make a different selection.'
          make_choice(arr)
        end
      when 'CC'
        if (arr[1][1] == '*')
          Game.place_shape(arr, @shape, 1, 1)
        else
          puts 'Spot is taken. Please make a different selection.'
          make_choice(arr)
        end
      when 'CR'
        if (arr[1][2] == '*')
          Game.place_shape(arr, @shape, 1, 2)
        else
          puts 'Spot is taken. Please make a different selection.'
          make_choice(arr)
        end
      when 'BL'
        if (arr[2][0] == '*')
          Game.place_shape(arr, @shape, 2, 0)
        else
          puts 'Spot is taken. Please make a different selection.'
          make_choice(arr)
        end
      when 'BC'
        if (arr[2][1] == '*')
          Game.place_shape(arr, @shape, 2, 1)
        else
          puts 'Spot is taken. Please make a different selection.'
          make_choice(arr)
        end
      when 'BR'
        if (arr[2][2] == '*')
          Game.place_shape(arr, @shape, 2, 2)
        else
          puts 'Spot is taken. Please make a different selection.'
          make_choice(arr)
        end
      else
        puts 'I don\'t know that choice!'
        make_choice(arr)
    end
    return choice
  end

  def check_victory(arr)
    return true if Game.three_in_row(arr)
    return true if Game.three_in_col(arr)
    return true if Game.three_in_diag(arr)
  end

  def check_tie(arr)
    return (Game.board_filled(arr)) && (not check_victory(arr))
  end
end