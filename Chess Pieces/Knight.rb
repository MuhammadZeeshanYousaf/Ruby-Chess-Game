require_relative 'ChessPiece'

class Knight < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "N-w"; end

  def b; "N-b"; end

  def valid_move? from, to
    if validate_pos(from, to)
      x_axis_from = from[0].ord - 96
      y_axis_from = from[1].to_i
      x_axis_to = to[0].ord - 96
      y_axis_to = to[1].to_i
      if valid_axis?(x_axis_from, y_axis_from, x_axis_to, y_axis_to)
        #All possible coordinates positions
        x = [1, 1, -1, -1, 2, 2, -2, -2]
        y = [2, -2, 2, -2, 1,-1, 1, -1]
        for i in 0...(x.length)
          test_x = x_axis_from + x[i]
          test_y = y_axis_from + y[i]
          if valid_axis?(test_x, test_y)
            if test_x == x_axis_to and test_y == y_axis_to
              return true
            end
          end
        end
        #if no axis match in loop then return false
        return false
      else
        return false
      end
    else
      false
    end
  end

  def can_move from, to, board

  end

  def move_to from, to, board

  end

  def moves x, y
    moves = []
    temp_x = nil
    temp_y = nil
    temp_x = x + 2
    temp_y = y + 1
    moves.push([temp_x, temp_y]) if valid_axis?(temp_x, temp_y)
      y = y - 1
    moves.push([temp_x, temp_y]) if valid_axis?(temp_x, temp_y)
    x = x - 2
      y = y + 1
      y = y - 1
    y = y + 2
      x = x + 1
      x = x - 1
    y = y - 2
      x = x + 1
      x = x -1
  end

end
