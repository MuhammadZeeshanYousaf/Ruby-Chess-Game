#get all chess pieces
require_relative 'Chess_Pieces/ChessPiece'
require_relative 'Chess_Pieces/Pawn'
require_relative 'Chess_Pieces/Bishop'
require_relative 'Chess_Pieces/Rook'
require_relative 'Chess_Pieces/King'
require_relative 'Chess_Pieces/Queen'
require_relative 'Chess_Pieces/Knight'

class ChessBoard
  
  def initialize
    #Chess.require_all_pieces
    @white = pieces true
    @black = pieces false
    @blank = ChessPiece.blank
    @chess_board = [    #2D array
      [@white[:r], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:r]], # a
      [@white[:n], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:n]], # b
      [@white[:b], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:b]], # c
      [@white[:q], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:q]], # d
      [@white[:k], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:k]], # e
      [@white[:b], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:b]], # f
      [@white[:n], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:n]], # g
      [@white[:r], @white[:p], @blank, @blank, @blank, @blank, @black[:p], @black[:r]]  # h
    ]
  end

  def get_board
    @chess_board
  end

  def get_box(row, col)
    @chess_board[row-1][col-1]
  end

  def set_box(row, col, value)
    @chess_board[row-1][col-1] = value
  end

  def reverse_board
    (@chess_board.length).times { |i|
      @chess_board[i-1].reverse!
    }
  end

  # @param [Boolean] are_white
  def pieces(are_white)
    #return hash
    Hash[ p: Pawn.new(are_white),
          r: Rook.new(are_white),
          n: Knight.new(are_white),
          b: Bishop.new(are_white),
          q: Queen.new(are_white),
          k: King.new(are_white)
    ]
  end

end