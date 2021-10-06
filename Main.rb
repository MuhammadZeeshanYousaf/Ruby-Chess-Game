require 'rubygems'
require_relative 'Chess'
#Dir["#{File.dirname(__FILE__)}/Chess\sPieces/*.rb"].each {|file| require_relative file }

puts "Welcome to Chess Game!"
print " - Enter Player-name for White: "
first_player = gets.chomp.to_s
# first_player = "Zeeshan"
print " - Enter Player-name for Black: "
second_player = gets.chomp.to_s
# second_player = "Hamza"
puts  #for line break

player = [first_player, second_player]
toggle_player = 1

chess_game = Chess.new player[0], player[1]
is_first_turn = true
begin
  chess_game.show_console chess_game.get_players[toggle_player].to_s
  menu_input = gets.chomp.to_i
  puts ":::::::::::::::::::::::::::::::::::::::::::::::::"
  case menu_input
  when 1
    print "\tEnter move (e.g, p=e2:e4): "
    begin
      move_input = gets.chomp.to_s
      is_moved = chess_game.move_piece move_input, chess_game.get_players[toggle_player].to_s, is_first_turn
    rescue ArgumentError => e
      puts e.message
      retry
    end
    puts "> Move Status: #{is_moved}"
    if is_moved.to_s[0].downcase.eql? 'k'
      chess_game.eliminate_player chess_game.get_players[toggle_player].to_s
      puts " > Game Over ('#{player[(toggle_player+1) % 2]}' Won) <"
    end

  when 2
    print "\tEnter game name to save: "
    save_name_input = gets.chomp.to_s
    saved_game_file = chess_game.save_game save_name_input
    puts "> Game saved in file '#{saved_game_file}'"

  when 3
    print "\tEnter game name to delete: "
    game_name = gets.chomp.to_s
    is_deleted = chess_game.delete_game game_name
    puts is_deleted ? "> Game successfully deleted." : "> Game '#{game_name}' does not exist."

  when 4
    print "\t Do you want to Reset Game? (y/n): "
    reset_input = gets.chomp.to_s
    if reset_input.downcase.eql? "y"
      chess_game.reset_game
    end

  when 5
    print "Do you want to exit game?  (y/n): "
    do_exit = gets.chomp.to_s
    do_exit.downcase == 'y' ? exit : nil

  end
  puts ":::::::::::::::::::::::::::::::::::::::::::::::::"

  toggle_player = (toggle_player+1) % 2
  is_first_turn = !toggle_player.eql?(1)
  chess_game.flip_board
  puts  #line break
end until chess_game.get_players()[toggle_player].eliminated?
