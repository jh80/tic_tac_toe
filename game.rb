# frozen_string_literal: true

# Game holds the elements of the game and manages turns

require './print_design'
require './winnable'

class Game
  include PrintDesign
  include Winnable

  @@messages = {
    board_at_max_width: 'The game board can be a maximum of 10 squares long. The width of the board is now 10.',
    board_at_max_height: 'The game board can be a maximum of 10 squares tall. The height of the board is now 10.',
    welcome_instructions: <<~RUBY,
      \nHello! Welcome to tic-tac-toe!#{' '}
      This game follows traditional tic-tac-toe rules.
      Submit your square choice in the format of LetterNumber ex: a1#{' '}
      Have fun! \n
    RUBY
    winner_announcement: ' has won! The game is over!',
    cat_game_announcement: 'no one won, but the game is over.'
  }

  def initialize(width = 3, height = width, player1_name = 'Player1', player2_name = 'Player2')
    @player1 = Player.new(player1_name, 'x')
    @player2 = Player.new(player2_name, 'o')
    @width = approve_dimention(width, 10)
    @height = approve_dimention(height, 10)
    @board = GameBoard.new(@width)
  end

  def play
    puts @@messages[:welcome_instructions]
    players = [@player1, @player2]
    @board.print_board
    continue = rotate_turns(players, @board)
    nil unless continue
  end

  def turn_sequence(players, board)
    players.each do |player|
      player.take_turn(board)
      board.print_board
      return false if ended_game?(player)
    end
  end

  def rotate_turns(players, board)
    loop do
      continue = turn_sequence(players, board)
      return false unless continue
    end
  end

  def cat_game?
    return if @board.any_sq_available?

    puts @@messages[:cat_game_announcement]
    print_cat
    true
  end

  def ended_game?(player)
    if winner(player)
      puts player.name + @@messages[:winner_announcement]
      return true
    end
    cat_game?
  end

  # TO DO fix print message to correctly apply to dimension
  def approve_dimention(dimension, dimension_max)
    if dimension > dimension_max
      puts @@messages[:board_at_max_width]
      return dimension_max
    end
    dimension
  end
end
