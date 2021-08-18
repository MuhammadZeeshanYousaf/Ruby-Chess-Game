require_relative 'Chess'

class ChessPiece < Chess
  def initialize is_white
    @is_white, @is_killed = is_white, false
  end

  def white?
    @is_white
  end

  def set_white=(value)
    @is_white = value
  end

  def valid_move? from, to, player; end

  def make_move from, to, player
    #abstract method to implement every piece
    raise NoMethodError, "#{self.class} is not implemented in subclass."
  end
end