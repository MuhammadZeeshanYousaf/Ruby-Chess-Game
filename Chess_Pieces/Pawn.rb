require_relative 'ChessPiece'

class Pawn < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "P-w"; end

  def b; "P-b"; end

  # @param [Boolean] is_first_turn
  def valid_move?(from, to, is_first_turn=false)
    if validate_pos(from, to)
      axis = get_axis from, to
      if valid_axis?(axis[:x_from], axis[:y_from], axis[:x_to], axis[:y_to])
        if (2..8).include?(axis[:y_from] + 1) and !is_first_turn
          if axis[:y_from] + 1 == axis[:y_to]
            if axis[:x_from] == axis[:x_to]; true
            elsif axis[:x_from]+1 == axis[:x_to] || axis[:x_from]-1 == axis[:x_to]; "attack"; end
          else; false; end
        elsif axis[:y_from] == 2 and is_first_turn
          return (axis[:y_from] + 1) == axis[:y_to] || (axis[:y_from] + 2) == axis[:y_to]
        else; false; end
      else; false; end
    else; false; end
  end

  # @param [ChessBoard] board
  # @param [Boolean] is_first_turn
  # returns (false || nil || dest_box_piece)
  def can_move?(from, to, board, is_first_turn)
    if is_first_turn
      move_status = valid_move? from, to, is_first_turn
      if !!move_status and !move_status.eql? "attack"
        move_to from, to, board
        true
      end
    else  #not a first turn
      super(from, to, board) do |_, _, _, _|
        false
      end
    end
    false
  end

end