require "./game_board.rb"
require "./player.rb"
require "./square"


game = GameBoard.new(3)
player1 = Player.new('player1', 'x')
player2 = Player.new('player2', 'o')

game.print_board

loop do
  choice = player1.get_sq_choice 
  break if game.execute_pick(choice, player1)
end

game.print_board
   
loop do 
  choice = player2.get_sq_choice
  break if game.execute_pick(choice, player2)
end

game.print_board