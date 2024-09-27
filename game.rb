class Game
  # TO DO take out attr_accesssor if I can
  attr_accessor :player1, :player2, :board

  def initialize(width = 3, height = width, player1_name = "Player1", player2_name = "Player2")
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
      if winner == true
        return true 
      end
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
      if winner == true 
        return true
      end
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
      if winner == true 
        return true
      end
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
    players = [@player1, @player2]
    @board.print_board
    loop do 
      players.each do |player|
        loop do
          choice = player.get_sq_choice 
          break if @board.execute_pick(choice, player)
        end
        @board.print_board
        if winner(player) 
          puts "#{player.name} has won! The game is over!"
          return
        end
      end
    end
  end
end