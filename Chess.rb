require_relative 'Player'
require_relative 'ConsoleInterface'
require_relative 'ChessBoard'
require_relative 'ManageGame'
#get all chess pieces
require_relative 'Chess_Pieces/ChessPiece'
require_relative 'Chess_Pieces/Pawn'
require_relative 'Chess_Pieces/Bishop'
require_relative 'Chess_Pieces/Rook'
require_relative 'Chess_Pieces/King'
require_relative 'Chess_Pieces/Queen'
require_relative 'Chess_Pieces/Knight'

class Chess

  def initialize(white_player_name, black_player_name)
    #Player Class objects
    @white_player = Player.new(white_player_name, true)
    @black_player = Player.new(black_player_name, false)
    #Chess.require_all_pieces
    @console = ConsoleInterface.new
    @board = ChessBoard.new
    @load_game = ManageGame.new
  end

  #move_string ( e.g. p=e2:e4 )
  def move_piece(move_string, player_name, first_turn = false)
    if move_string =~ /^\s*[prnbqk]\s*=\s*[a-h][1-8]\s*:\s*[a-h][1-8]$/i
      #input is valid now
      piece_positions = move_string.split("=")
      prev_new_pos = piece_positions[1].split(":")

      #get piece color to move
      if @white_player.to_s.eql? player_name
        piece_to_move = ChessPiece.new @white_player.white?
      elsif @black_player.to_s.eql? player_name
        piece_to_move = ChessPiece.new @black_player.white?
      else
        return false
      end

      is_pawn = false   #check if pawn is the piece to move

      #get the piece to move
      case piece_positions[0].downcase
      when 'p'
        pawn_move = Pawn.new piece_to_move.white?
        is_pawn = true
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

      #start moving piece process
      if is_pawn
        move_status = pawn_move.can_move? prev_new_pos[0], prev_new_pos[1], @board, first_turn
      else
        move_status = piece_to_move.can_move? prev_new_pos[0], prev_new_pos[1], @board
      end
      if move_status == false
        puts  "CANNOT MOVE PIECE"
      elsif move_status == nil
        puts "PIECE MOVED WITHOUT ANY ATTACK"
      else
        puts "PIECE MOVED BY ATTACKING ON #{move_status.to_s}"
      end
    else; false; end
  end


  def save_game(game_name)
    @load_game.export_game game_name, get_players, @board
  end

  def load_game(game_name)
    @load_game.import_game game_name
    # to define -------
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
    [@white_player, @black_player]
  end

  def show_console player
    @console.display_board @board
    @console.show_menu player
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
