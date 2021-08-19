require_relative 'ChessPiece'

class Knight < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "N-w"; end

  def b; "N-b"; end

  def valid_move? from, to, player
    #definition
  end

end
