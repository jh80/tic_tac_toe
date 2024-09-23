require "./game_board.rb"
require "./player.rb"

game = GameBoard.new()
player1 = Player.new('player1', 'x')
player2 = Player.new('player2', 'o')
game.print_board
player1.get_sq_choice