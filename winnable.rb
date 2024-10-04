module Winnable 
  
  def player_array(player, start_i, end_i, step_amt=1)
    a = []
    (start_i...end_i).step(step_amt) do |i|
      a.push(@board.squares[i].contents == player.mark ? @board.squares[i].contents : (return a))
    end
    return a
  end

  def column_winner?(player) 
    # Start a check at top of each column
    (0...@width).each do |column|
      return true if player_array(player, column, (@width * @height), @width).length == @height
    end
    return false
  end 

  def row_winner?(player) 
    # Start at begining of each row
    (0...(@width*@height)).step(@width) do |row|
      return true if player_array(player, row, row+@width).length == @width
    end
    return false
  end

  def diagonal_winner?(player) 
    # Start at the top corners
    (0...@width).step(@width - 1) do |starting_side|
      # Check down diagonal
      step_angle = starting_side == 0 ? (@width + 1) : (@width - 1)
      ending_side = starting_side == 0 ? (@width * @height) : (@width * (@height - 1) + 1)
      return true if player_array(player, starting_side, ending_side, step_angle).length == @width
    end
    return false
  end

  def winner(player)
    if column_winner?(player) || row_winner?(player) || diagonal_winner?(player) 
      return player
    end
    return false
  end
end
