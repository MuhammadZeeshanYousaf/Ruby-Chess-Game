class ChessPiece

  def initialize is_white
    @is_white, @is_killed = is_white, false
  end

  #@abstract methods
  def w; end
  def b; end
  def valid_move? from, to, player; end
  def make_move from, to, player
    #abstract method to implement every piece
    raise NoMethodError, "#{self.class} is not implemented in subclass."
  end

  #defined methods
  def blank
    '___'
  end

  def white?
    @is_white
  end

  def killed?
    @is_killed
  end

  def kill
    @is_killed= true
  end

  def set_white=(value)
    @is_white = value
  end

end