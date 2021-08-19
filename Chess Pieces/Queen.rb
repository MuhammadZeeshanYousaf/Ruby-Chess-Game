require_relative 'ChessPiece'

class Queen < ChessPiece

  def initialize is_white
    super is_white
  end

  #override
  def w; "Q-w"; end

  def b; "Q-b"; end

  def valid_move? from, to, player
    #definition
  end

end
