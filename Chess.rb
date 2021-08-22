class Chess

  def initialize(white_player_name, black_player_name)
    #Player Class objects
    @white_player = Player.new(white_player_name, true)
    @black_player = Player.new(black_player_name, false)
    self.require_all_pieces
    @console = ConsoleInterface.new
    @board = ChessBoard.new
    @load_game = ManageGame.new
  end

  #move_string ( e.g. p=e2:e4 )
  def move_piece(move_string, player_name)
    if move_string =~ /^\s*[prnbqk]\s*=\s*[a-h][1-8]\s*:\s*[a-h][1-8]$/i
      #input is valid now
      piece_positions = move_string.split("=")
      prev_new_pos = piece_positions[1].split(":")

      if @player1.to_s.eql? player_name
        piece_to_move = ChessPiece.new @player1.white?
      elsif @player2.to_s.eql? player_name
        piece_to_move = ChessPiece.new @player2.white?
      else
        return false
      end
      case piece_positions[0].downcase
      when 'p'
        piece_to_move = Pawn.new piece_to_move.white?
      when 'r'
        piece_to_move = Rook.new piece_to_move.white?
      when 'n'
        piece_to_move = Knight.new piece_to_move.white?
      when 'b'
        piece_to_move = Bishop.new piece_to_move.white?
      when 'q'
        piece_to_move = Queen.new piece_to_move.white?
      when 'k'
        piece_to_move = King.new piece_to_move.white?
      else
        false
      end
      piece_to_move.valid_move? from, to
    else
      false
    end
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

  #class methods
  def self.require_piece(piece_name)
    require_relative 'Chess_Pieces/' + piece_name
  end

  def self.require_all_pieces
    self.require_piece 'ChessPiece'
    self.require_piece 'Pawn'
    self.require_piece 'Rook'
    self.require_piece 'Knight'
    self.require_piece 'Bishop'
    self.require_piece 'Queen'
    self.require_piece 'King'
  end

end
