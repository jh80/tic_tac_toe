require "./square.rb"

class GameBoard
  attr_reader :squares, :any_sq_available
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
    count = 0
    (1..@width).each do |column_num| 
      print "   #{column_num}"
    end
    puts ""
    (1..@height).each do |row_num|
      row_letter = (row_num + 96).chr
      print "#{row_letter } "
      (1..@width).each do |column_num|
        print " #{squares[count].contents}"
        count += 1
        print ' |' unless column_num == @width
      end
      unless row_num == @height
        puts ""
        print " "
        (1..@width).each do 
          print ' ---'
        end
        puts ""
      end
    end
    puts ""
  end

  # TO DO this is pretty much find_sq_by_name I don't think I need both- pick one
  def sq_index_from_name(sq_name) 
    @squares.each_with_index do |square, index|
      return index if square.name == sq_name.downcase
    end
    puts "I could not find your square. Alert programmer of issue."    
  end

  def find_sq_by_name(sq_name) 
    @squares.each do |square|     
      return square if square.name == sq_name.downcase
    end
    puts <<~RUBY
      I could not find your square. Make sure to use a LetterNumber format (ex: a1).
      Using the letters and numbers on the grid.
    RUBY
  end

  # Alternate route, more efficient, less dynamic
  # def find_sq_by_name(sq_name, squares, width) 
  #   row_num = width * (sq_name[0].to_i - 61) 
  #   col_num = sq_name[1].to_i
  #   squares[row_num + col_num]
  # end

  # TO DO maybe get rid of find_by_sq_name method and use sq_index method
  def execute_pick(square_choice, player)
    if square = find_sq_by_name(square_choice) 
      if sq_available?(square)
        square.contents = player.mark
        return true  
      end
    else
      return false
    end
  end

  def sq_available?(square)
    return true if square.available?
    return false
  end

  def any_sq_available?
    @squares.any?{|square| sq_available?(square)}
  end
end