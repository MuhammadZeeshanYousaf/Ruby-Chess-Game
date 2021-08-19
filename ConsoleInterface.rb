class ConsoleInterface

  def display_board chess_board
    (1..8).each { |i| ; print "     #{i}"; }

    puts  #line break in console
    @chess_board.each do |element|
      print "#{element[0]} | "
      (1...(element.length)).each { |i|
        print element[i], " : "
      }
      puts "\b\b |"
    end
  end

  def show_menue player
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