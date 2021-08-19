require_relative 'ChessPiece'

class Bishop < ChessPiece
  def initialize is_white
    super is_white
  end

  #override
  def w; "B-w"; end

  def b; "B-b"; end

  def valid_move? from, to, player
    #definition
  end

end
