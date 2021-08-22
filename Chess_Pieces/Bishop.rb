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
      axis = get_axis from, to
      if valid_axis?(axis[:x_from], axis[:y_from], axis[:x_to], axis[:y_to])
        diff_from = axis[:x_from] - axis[:y_from]
        diff_to = axis[:x_to] - axis[:y_to]
        return diff_from == diff_to
      else
        return false
      end
    else
      false
    end
  end

  def can_move? from, to, board

  end

end
