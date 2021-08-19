class Chess

  def initialize player1_name, player2_name
    #Player Class objects
    @player1 = Player.new(player1_name, true)
    @player2 = Player.new(player2_name, false)
    self.require_all_pieces
    @console = ConsoleInterface.new
    @board = ChessBoard.new
    @load_game = ManageGame.new
  end


  #--------------------methods

  #move_string ( e.g. p=e2:e4 )
  def move_piece move_string

  end

  def reset_game
    @board = ChessBoard.new
    player1_name = @player1.to_s
    player2_name = @player2.to_s
    @player1 = Player.new player1_name, true
    @player2 = Player.new player2_name, false
    @console = ConsoleInterface.new
  end

  #accessor methods
  def get_players
    [@player1, @player2]
  end
  # -------------------end

  #class methods
  def self.require_piece piece_name
    require_relative 'Chess Pieces/'+ piece_name
  end

  def self.require_all_pieces
    require_piece 'ChessPiece'
    require_piece 'Pawn'
    require_piece 'Rook'
    require_piece 'Knight'
    require_piece 'Bishop'
    require_piece 'Queen'
    require_piece 'King'
  end

end
