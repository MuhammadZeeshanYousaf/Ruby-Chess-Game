require_relative 'ChessPiece'

class Pawn < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "P-w"; end

  def b; "P-b"; end

  def valid_move? from, to, is_first_turn
    if validate_pos(from, to)
      x_axis_from = from[0].ord - 96
      y_axis_from = from[1].to_i
      x_axis_to = to[0].ord - 96
      y_axis_to = to[1].to_i
      if valid_axis?(x_axis_from, y_axis_from, x_axis_to, y_axis_to)
        if (3..8).include?(y_axis_from + 1)
          return (y_axis_from + 1) == y_axis_to
        elsif y_axis_from == 2 and is_first_turn == true
            return (y_axis_from + 1) == y_axis_to or (y_axis_from + 2) == y_axis_to
        else
          return false
        end
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