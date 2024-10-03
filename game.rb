require "./print_design.rb"

class Game
  include PrintDesign

  @@messages = {
    board_at_max_width: "The game board can be a maximum of 10 squares long. The width of the board is now 10.",
    board_at_max_height: "The game board can be a maximum of 10 squares tall. The height of the board is now 10.",
    welcome_instructions: <<~RUBY, 
      \nHello! Welcome to tic-tac-toe! 
      This game follows traditional tic-tac-toe rules.
      Submit your square choice in the format of LetterNumber ex: a1 
      Have fun! \n
    RUBY
    winner_announcement: " has won! The game is over!",
    cat_game_announcement: "no one won, but the game is over."
  }

  def initialize(width = 3, height = width, player1_name = "Player1", player2_name = "Player2")
    if width > 10 
      width = 10
      puts @@messages[:board_at_max_width]
    end

    if height > 10
      height = 10
      puts @@message[:board_at_max_height]
    end

    @player1 = Player.new(player1_name, "x")
    @player2 = Player.new(player2_name, "o")
    @width =  width
    @height = height
    @board = GameBoard.new(width)
  end

  def column_winner?(player) 
    # Start a check at top of each column
    (0...@width).each do |column|
      winner = true
      # Check down the column
      (column...(@width * @height)).step(@width) do |index|
        unless @board.squares[index].contents == player.mark 
          winner = false
          break
        end
      end
      return true if winner == true
    end
    return false
  end 

  # TO DO can row_winner? and column_winner? be reduced into one method?
  def row_winner?(player) 
    # Start at begining of each row
    (0...(@width*@height)).step(@width) do |row|
      winner = true 
      # Check through row
      (row...row+@width).each do |index| 
        unless @board.squares[index].contents == player.mark 
          winner = false
          break
        end 
      end
      return true if winner == true 
    end
    return false
  end

  def diagonal_winner?(player) 
    # Start at the top corners
    (0...@width).step(@width - 1) do |starting_side|
      winner = true 
      # Check down diagonal
      step_angle = starting_side == 0 ? (@width + 1) : (@width - 1)
      ending_side = starting_side == 0 ? (@width * @height) : (@width * (@height - 1) + 1)
      (starting_side...(ending_side)).step(step_angle) do |index| 
        unless @board.squares[index].contents == player.mark 
          winner = false
          break 
        end
      end
      # TO DO Shorten all these tiny coniditionals into one line
      return true if winner == true 
    end
    return false
  end

  def winner(player)
    if column_winner?(player) || row_winner?(player) || diagonal_winner?(player) 
      return player
    end
    return false
  end

  def play 
    # Welcome players and give guidence
    puts @@messages[:welcome_instructions]
    players = [@player1, @player2]
    @board.print_board
    loop do 
      players.each do |player|
        loop do
          choice = player.get_sq_choice 
          break if @board.execute_pick(choice, player)
        end
        @board.print_board
        return if ended_game?(player)
      end
    end
  end

  def cat_game? 
    if !@board.any_sq_available?
      puts @@messages[:cat_game_announcement]
      print_cat
      return true
    end
  end

  def ended_game?(player) 
    if winner(player)
      puts player.name + @@messages[:winner_announcement]
      return true
    end
    cat_game?
  end
end