require_relative 'Chess'
require_relative 'Chess_Pieces/ChessPiece'
Dir["#{File.dirname(__FILE__)}/Chess\sPieces/*.rb"].each {|file| require_relative file }

puts "Welcome to Chess Game!"
print " - Enter Player-name for White: "
first_player = gets.chomp.to_s
print " - Enter Player-name for Black: "
second_player = gets.chomp.to_s
puts

#make player
player = [WhitePlayer.new(first_player), BlackPlayer.new(second_player)]
toggle_player = 1
new_game = Chess.new player[0], player[1]

begin
  new_game.display_board

  toggle_player = (toggle_player+1) % 2
end until player[toggle_player].killed?