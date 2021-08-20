require_relative 'ChessPiece'

class Pawn < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "P-w"; end

  def b; "P-b"; end

  def valid_move? from, to #, is_first_turn
    if validate_pos(from, to)
      axis = get_axis from, to
      if valid_axis?(axis[:x_from], axis[:y_from], axis[:x_to], axis[:y_to])
        if (3..8).include?(axis[:y_from] + 1)
          return (axis[:y_from] + 1) == axis[:y_to]
        elsif axis[:y_from] == 2 #and is_first_turn == true
            return (axis[:y_from] + 1) == axis[:y_to] || (axis[:y_from] + 2) == axis[:y_to]
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