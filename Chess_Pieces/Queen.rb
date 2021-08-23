require_relative 'ChessPiece'

class Queen < ChessPiece

  def initialize(is_white)
    super is_white
  end

  #override
  def w; "Q-w"; end

  def b; "Q-b"; end

  def valid_move?(from, to)
    Rook.new(white?).valid_move?(from, to) || Bishop.new(white?).valid_move?(from, to)
  end

  # returns (false || nil || dest_box_piece)
  def can_move?(from, to, board)
    rook_return = Rook.new(white?).can_move?(from, to, board)
    if rook_return == false
      bishop_return = Bishop.new(white?).can_move?(from, to, board)
      if bishop_return == false
        false
      else
        bishop_return
      end
    else
      rook_return
    end
  end

end
