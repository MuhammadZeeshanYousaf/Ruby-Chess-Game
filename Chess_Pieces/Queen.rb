require_relative 'ChessPiece'

class Queen < ChessPiece

  def initialize(is_white)
    super is_white
  end

  #override
  def w; "Q-w"; end

  def b; "Q-b"; end

  def valid_move?(from, to)
    Bishop.new(@is_white).valid_move?(from, to) || Rook.new(@is_white).valid_move?(from, to)
  end

  # returns (false || nil || dest_box_piece)
  def can_move?(from, to, board)
    bishop_return = Bishop.new(@is_white).can_move?(from, to, board)
    if bishop_return == false
      rook_return = Rook.new(@is_white).can_move?(from, to, board)
      if Rook.new(@is_white).can_move?(from, to, board) == false
        false
      else
        rook_return
      end
    else
      bishop_return
    end
  end

end
