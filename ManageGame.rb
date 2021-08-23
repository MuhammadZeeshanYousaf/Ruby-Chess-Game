class ManageGame

  GAMES_DIR = "Saved_Games"

  # @param [ChessBoard] chess_board
  def export_game(game_name, players, chess_board)
    #get necessary information
    player1 = players[0].to_s
    player2 = players[1].to_s
    Dir.mkdir GAMES_DIR unless Dir.exist? GAMES_DIR
    filepath = "#{GAMES_DIR}/#{game_name}.txt"

    #make file and save game
    game_file = File.new(filepath, "w+")
    (chess_board.get_board.length).times { |i|
      game_file.syswrite("|")
      chess_board.get_board[i-1].each do |element|
        game_file.syswrite("#{element} : ")
      end
      game_file.syswrite("|\n")
    }

    game_file.syswrite("\n#{player1.to_s},#{player2.to_s}")
    game_file.close
    filepath
  end

  def delete_game_file(game_name)
    exist?(game_name) ? File.delete(filepath game_name) : false
  end

  #for class use
  def exist?(game_name)
    if Dir.exist? GAMES_DIR
      File.file?(filepath(game_name))
    else
      Dir.mkdir GAMES_DIR
    end
  end

  def filepath(game_name)
    "#{GAMES_DIR}/#{game_name}.txt"
  end

end