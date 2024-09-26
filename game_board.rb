require "./square.rb"

class GameBoard
  # TO DO come back later to tighten the creattion variable setting of squares (use each)
  def initialize(width, height=width) 
    @squares = []
    @width = width
    @height = height
    # Create all the necessary Square instances
    (width * height).times do |sq_num|
      # This works without rounding down because both numbers are integers
      row_letter = ((sq_num/width) + 97).chr
      col_num = (sq_num%width) + 1
      @squares << Square.new(row_letter + (col_num.to_s))
    end
  end

  def print_board
    # TO DO later refactor to use an each loop
    puts "   1   2   3 "
    puts "a  #{@squares[0].contents} | #{@squares[1].contents} | #{@squares[2].contents} "
    puts "  --- --- ---"
    puts "b  #{@squares[3].contents} | #{@squares[4].contents} | #{@squares[5].contents} "
    puts "  --- --- ---"
    puts "c  #{@squares[6].contents} | #{@squares[7].contents} | #{@squares[8].contents} "
  end

  # TO DO this is pretty much find_sq_by_name I don't think I need both- pick one
  def sq_index_from_name(sq_name, squares) 
    squares.each_with_index do |square, index|
      if square.name == sq_name.downcase
        return index
      end
    end
    puts "I could not find your square. Alert programmer of issue."    
  end

  def find_sq_by_name(sq_name, squares) 
    squares.each do |square|
      if square.name == sq_name.downcase
        return square
      end
    end
    puts "I could not find your square. Alert programmer of issue."
  end

  # Alternate route, more efficient, less dynamic
  # def find_sq_by_name(sq_name, squares, width) 
  #   row_num = width * (sq_name[0].to_i - 61) 
  #   col_num = sq_name[1].to_i
  #   squares[row_num + col_num]
  # end

  # TO DO maybe get rid of find_by_sq_name method and use sq_index method
  def execute_pick(square_choice, player)
    if square = find_sq_by_name(square_choice, @squares)
        square.contents = player.mark
      return true  
    else
      return false
    end
  end

  def column_winner?(player) 
    # Start a check at top of each column
    (0...@width).each do |column|
      winner = true
      # Check down the column
      (column...(@width * @height)).step(@width) do |index|
        unless @squares[index].contents == player.mark 
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
        unless @squares[index].contents == player.mark 
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
        unless @squares[index].contents == player.mark 
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
end