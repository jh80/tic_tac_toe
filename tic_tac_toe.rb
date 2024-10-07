# frozen_string_literal: true

require 'pry-byebug'

require './game_board'
require './player'
require './square'
require './game'

our_game = Game.new

# puts our_game.board.find_sq_by_name("b2").contents
# puts our_game.board.find_sq_by_name("b2")
# our_game.board.execute_pick("b2", our_game.player1)
# puts our_game.board.find_sq_by_name("b2").contents
# puts our_game.board.find_sq_by_name("b2")

# our_game.board.execute_pick("b2", our_game.player1)
# our_game.board.print_board
# puts our_game.board.sq_available?(our_game.board.find_sq_by_name("b2", our_game.board.squares))
# puts our_game.board.sq_available?(our_game.board.squares[0])

our_game.play
