class ChessPiece

  def initialize(is_white)
    @is_white = is_white
    # @is_white, @is_killed = is_white, false
  end

  #@abstract methods
  def w; end
  def b; end
  def valid_move?(from, to); end
  def can_move?(from, to, board); end
  def move_to(from, to, player)
    #abstract method to implement every piece
    raise NoMethodError, "#{self.class} is not implemented in subclass. (Chess Piece not defined)"
  end

  #defined methods
  def blank
    '___'
  end

  def white?
    @is_white
  end

=begin
  def killed?
    @is_killed
  end

  def kill
    @is_killed= true
  end
=end

  def set_white=(value)
    @is_white = value
  end

  def validate_pos(from, to)
    pos_regex = /^[a-h][1-8]$/i
    from =~ pos_regex and to =~ pos_regex
  end

  def valid_axis?(*coordinates)
    cord_range = 1..8
    coordinates.each do |axis|
      unless cord_range.include?(axis)
        return false
      end
    end
    true
  end

  def get_axis from, to
    x_axis_from = from[0].ord - 96
    y_axis_from = from[1].to_i
    x_axis_to = to[0].ord - 96
    y_axis_to = to[1].to_i
    {x_from: x_axis_from, y_from: y_axis_from, x_to: x_axis_to, y_to: y_axis_to}
  end

end