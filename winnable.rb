module Winnable 

  def player_array(player, start_i, end_i, step_amt=1)
    a = []
    (start_i...end_i).step(step_amt) do |i|
      a.push(@board.squares[i].contents == player.mark ? @board.squares[i].contents : (return a))
    end
    return a
  end
end
