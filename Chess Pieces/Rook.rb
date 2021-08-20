require_relative 'ChessPiece'

class Rook < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "R-w"; end

  def b; "R-b"; end

  def valid_move? from, to

  end

  def can_move from, to, board

  end

  def move_to from, to, board

  end

end
