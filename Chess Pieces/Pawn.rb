require_relative 'ChessPiece'

class Pawn < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "P-w"; end

  def b; "P-b"; end

  def valid_move? from, to, player
    #definition
  end

end