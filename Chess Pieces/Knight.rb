require_relative 'ChessPiece'

class Knight < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "N-w"; end

  def b; "N-b"; end

  def valid_move? from, to

  end

  def can_move from, to, board

  end

  def move_to from, to, board

  end

end
