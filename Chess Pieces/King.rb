require_relative 'ChessPiece'

class King < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "K-w"; end

  def b; "K-b"; end

  def valid_move? from, to, player
    #definition
  end

end
