require_relative 'Chess Pieces/*'

class Chess
  BLANK = '___'
  def initialize player1, player2
    @chess_board = [    #2D array
        ['a', Rook::W,   Pawn::W, BLANK, BLANK, BLANK, BLANK, Pawn::B, Rook::B],
        ['b', Knight::W, Pawn::W, BLANK, BLANK, BLANK, BLANK, Pawn::B, Knight::B],
        ['c', Bishop::W, Pawn::W, BLANK, BLANK, BLANK, BLANK, Pawn::B, Bishop::B],
        ['d', Queen::W,  Pawn::W, BLANK, BLANK, BLANK, BLANK, Pawn::B, Queen::B],
        ['e', King::W,   Pawn::W, BLANK, BLANK, BLANK, BLANK, Pawn::B, King::B],
        ['f', Bishop::W, Pawn::W, BLANK, BLANK, BLANK, BLANK, Pawn::B, Bishop::B],
        ['g', Knight::W, Pawn::W, BLANK, BLANK, BLANK, BLANK, Pawn::B, Knight::B],
        ['h', Rook::W,   Pawn::W, BLANK, BLANK, BLANK, BLANK, Pawn::B, Rook::B]
    ]
    #Player Class objects
    @player1 = player1
    @player2 = player2
  end

  def get_active_board
    @chess_board
  end

  def get_players
    [@player1, @player2]
  end


end
