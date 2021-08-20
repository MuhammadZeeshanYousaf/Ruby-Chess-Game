require_relative 'ChessPiece'

class Queen < ChessPiece

  def initialize(is_white)
    super is_white
  end

  #override
  def w; "Q-w"; end

  def b; "Q-b"; end

  def valid_move?(from, to)
    Bishop.new(@is_white).valid_move?(from, to) or Rook.new(@is_white).valid_move?(from, to)
  end

  def can_move(from, to, board) end

  def move_to(from, to, board) end

end
