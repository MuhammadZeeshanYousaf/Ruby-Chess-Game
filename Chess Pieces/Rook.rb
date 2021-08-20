require_relative 'ChessPiece'

class Rook < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "R-w"; end

  def b; "R-b"; end

  def valid_move? from, to
    if validate_pos(from, to)
      axis = get_axis from, to
      if valid_axis?(axis[:x_from], axis[:y_from], axis[:x_to], axis[:y_to])
        if axis[:x_from] == axis[:x_to]
          return (axis[:y_from] - axis[:y_to]) != 0
        elsif axis[:y_from] == axis[:y_to]
          return (axis[:x_from] - axis[:x_to]) != 0
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
