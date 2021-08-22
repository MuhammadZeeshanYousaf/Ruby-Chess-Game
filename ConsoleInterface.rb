class ConsoleInterface

  # @param [ChessBoard] chess_board
  def display_board(chess_board)
    (1..8).each { |i| ; print "     #{i}"; }

    puts  #line break in console
    char = 'a'
    (chess_board.get_board).each do |row|
      print "#{char} | "
      (0...(row.length)).each { |i|
        print row[i], " : "
      }
      puts "\b\b |"
      char.next!
    end
  end

  def show_menu(player)
    puts "\n (Its #{player.upcase}'s Turn)"
    puts "1. Make Move"
    puts "2. Save Game"
    puts "3. Reset Game"
    puts "--------------"
  end

=begin
  def process_user_input
    case gets.chomp.to_s
    when '1'
      print "Write your move ( e.g. p=e2:e4 ): "
      #take input
    when '2'
      #save a file with game specific name
    when '3'
      #reset game
    else
      puts "Invalid Input!"
    end
  end
=end

end