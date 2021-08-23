class Player

  #attr_accessor :pawns_killed, :pawns_live, :rooks_killed, :rooks_live, :knights_killed, :knights_live, :bishops_killed, :bishops_live, :queen_live, :king_live
  def initialize name, is_color_white
    @name = name
    @is_white = is_color_white
    @is_eliminated = false
    # @pawns_killed = 0
    # @pawns_live   = 8
    # @rooks_killed = 0
    # @rooks_live   = 2
    # @knights_killed = 0
    # @knights_live   = 2
    # @bishops_killed = 2
    # @bishops_live   = 2
    # @queen_live = true
    # @king_live  = true
  end

  def change_name=(value)
    @name = value
  end

  def white?
    @is_white
  end

  def eliminated?
    @is_eliminated
  end

  def eliminate
    @is_eliminated = true
  end

  def to_s
    @name
  end

end
