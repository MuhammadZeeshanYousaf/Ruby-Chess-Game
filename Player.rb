class Player

  attr_accessor :pawns_killed, :pawns_live, :rooks_killed, :rooks_live, :knights_killed, :knights_live, :bishops_killed, :bishops_live, :queen_live, :king_live

  def initialize name, is_color_white
    @name = name
    @is_white = is_color_white
    @is_eliminated = false
    # @my_pawns   = get_pieces('p', 8)
    # @my_rooks   = get_pieces('r', 2)
    # @my_knights = get_pieces('n', 2)
    # @my_bishops = get_pieces('b', 2)
    # @my_queen   = get_pieces('q', 1)[0]
    # @my_king    = get_pieces('k', 1)[0]
    @pawns_killed = 0
    @pawns_live   = 8
    @rooks_killed = 0
    @rooks_live   = 2
    @knights_killed = 0
    @knights_live   = 2
    @bishops_killed = 2
    @bishops_live   = 2
    @queen_live = true
    @king_live  = true
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

=begin
  #for Class use only
  def get_pieces piece, n
    case piece
    when 'p'
      piece_to_create = Pawn.new @is_white
    when 'r'
      piece_to_create = Rook.new @is_white
    when 'n'
      piece_to_create = Knight.new @is_white
    when 'b'
      piece_to_create = Bishop.new @is_white
    when 'q'
      piece_to_create = Queen.new @is_white
    when 'k'
      piece_to_create = King.new @is_white
    else
      piece_to_create = ChessPiece.new(@is_white).blank
    end
    #create array of pieces required
    pieces_arr = []
    n.times do
      pieces_arr.push(piece_to_create)
    end
    pieces_arr
  end

  private :get_pieces
=end
end
