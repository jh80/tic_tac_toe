require "pry-byebug"

require "./game_board.rb"
require "./player.rb"
require "./square.rb"
require "./game.rb"



our_game = Game.new()

our_game.board.execute_pick("b2", our_game.player1)
our_game.board.print_board
puts our_game.board.sq_available?(our_game.board.find_sq_by_name("b2", our_game.board.squares))
puts our_game.board.sq_available?(our_game.board.squares[0])

#our_game.play

