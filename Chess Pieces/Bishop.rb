require_relative 'ChessPiece'

class Bishop < ChessPiece
  def initialize is_white
    super is_white
  end

  #override
  def w; "B-w"; end

  def b; "B-b"; end

  def valid_move? from, to
    if validate_pos(from, to)
      x_axis_from = from[0].ord - 96
      y_axis_from = from[1].to_i
      x_axis_to = to[0].ord - 96
      y_axis_to = to[1].to_i
      if valid_axis?(x_axis_from, y_axis_from, x_axis_to, y_axis_to)
        diff_from = x_axis_from - y_axis_from
        diff_to = x_axis_to - y_axis_to
        return diff_from == diff_to
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

end
