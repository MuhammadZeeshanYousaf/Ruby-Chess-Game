require_relative 'Chess'
#Dir["#{File.dirname(__FILE__)}/Chess\sPieces/*.rb"].each {|file| require_relative file }

puts "Welcome to Chess Game!"
print " - Enter Player-name for White: "
first_player = gets.chomp.to_s
print " - Enter Player-name for Black: "
second_player = gets.chomp.to_s
puts  #for line break

player = [first_player, second_player]
toggle_player = 1
my_game = Chess.new player[0], player[1]
is_first_turn = true
begin
  my_game.show_console player[toggle_player]
  menue_input = gets.chomp.to_i
  case menue_input
  when 1
    print "\tEnter move (e.g, p=e2:e4): "
    move_input = gets.chomp.to_s
    if my_game.move_piece move_input, player[toggle_player], is_first_turn
      puts "\t Piece moved Successfully!"
    end

  when 2
    print "\tEnter game name to save: "
    save_name_input = gets.chomp.to_s
    my_game.save_game save_name_input

  when 3
    print "\t Do you want to Reset Game ? (y/n): "
    reset_input = gets.chomp.to_s
    if reset_input.downcase.eql? "y"
      my_game.reset_game
    end
  end

  toggle_player = (toggle_player+1) % 2
  is_first_turn = !toggle_player.eql?(1)
end until my_game.get_players()[toggle_player].eliminated?
