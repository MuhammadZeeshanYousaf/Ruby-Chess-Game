class ChessBoard
  
  def initialize
    Chess.require_all_pieces
    @white = pieces true
    @black = pieces false
    @blank = ChessPiece.new(true).blank
    @chess_board = [    #2D array
      ['a', @white[:r], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:r]],
      ['b', @white[:n], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:n]],
      ['c', @white[:b], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:b]],
      ['d', @white[:q], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:q]],
      ['e', @white[:k], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:r]],
      ['f', @white[:b], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:b]],
      ['g', @white[:n], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:n]],
      ['h', @white[:r], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:r]]
    ]
  end

  def get_board
    @chess_board
  end

  def get_box row, col
    @chess_board[row][col]
  end

  def set_box row, col, value
    @chess_board[row][col] = value
  end

  def pieces are_white
    #return hash
    { p: Pawn.new(are_white),
      r: Rook.new(are_white),
      n: Knight.new(are_white),
      b: Bishop.new(are_white),
      q: Queen.new(are_white),
      k: King.new(are_white)
    }
  end

end
