class ConsoleInterface

  # @param [ChessBoard] chess_board
  def display_board(chess_board)
    (1..8).each { |i| print "     #{i}"; }

    puts  #line break in console
    char = 'a'

    (chess_board.get_board).each do |row|
      print "#{char} | "
      (0...(row.length)).each { |i|
        print row[i], " : "
      }
      print "\b\b | #{char}\n"
      char.next!
    end

  end

  def show_menu(player)
    puts "\n(Its #{player.upcase}'s Turn)"
    puts "1. Make Move"
    puts "2. Save Game"
    puts "3. Delete saved Game"
    puts "4. Reset Game"
    puts "5. Exit"
    puts "> Enter Choice: "
  end

end