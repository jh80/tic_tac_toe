require "./square.rb"

class GameBoard

  # TO DO come back later to tighten the creattion variable setting of squares (use each)
  def initialize(width, height=width) 
    @squares = []
    # Create all the necessary Square instances
    (width * height).times do |sq_num|
      # This works without rounding down because both numbers are integers
      row_letter = ((sq_num/width) + 97).chr
      col_num = (sq_num%width) + 1
      @squares << Square.new(row_letter + (col_num.to_s))
    end
    @a1 = " "
    @a2 = " "
    @a3 = " "
    @b1 = " "
    @b2 = " "
    @b3 = " "
    @c1 = " "
    @c2 = " "
    @c3 = " "
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

  def execute_pick(square_choice, player)
    @squares.each do |square|
      if square.name == square_choice
        square.contents = player.mark
        return
      end
    end
    return false
  end

end