class ManageGame

  GAMES_DIR = "./Saved Games"

  #game_name = string, chess_object = Chess
  def save_game game_name, chess_object
    #get necessary information
    player1 = chess_object.get_players[0]
    player2 = chess_object.get_players[1]
    Dir.mkdir GAMES_DIR
    filepath = "#{GAMES_DIR}/#{game_name}.txt"

    #make file and save game
    game_file = File.new(filepath, "w+")
    game_file.syswrite("#{chess_object.get_active_board}\n#{player1},#{player2}")
    game_file.close
  end

  #returns array [chess_board, player1, player2]
  def continue_game game_name
    #read from file
    if exist? game_name
      saved_game_file = File.open(filepath game_name, "r")
      lines_read = saved_game_file.readlines
      chess_board = eval(lines_read[0])
      players = lines_read[1].split(",")
      saved_game_file.close
      player1 = Player.new players[0], true
      player2 = Player.new players[1], false
      [chess_board, player1, player2]
    else nil
    end
  end

  def delete_game game_name
    exist?(game_name)? File.delete(filepath game_name) : false
  end

  def exist? game_name
    unless Dir.exist? GAMES_DIR
      Dir.mkdir GAMES_DIR
    end
    File.file?(filepath game_name)
  end

  #player objects in params
  def new_game chess_obj, player1, player2
    chess_obj = Chess.new player1, player2
  end

  def filepath game_name
    "#{GAMES_DIR}/#{game_name}.txt"
  end
  private :filepath

end