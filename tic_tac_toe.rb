
class GameBoard
  # TO DO come back later to tighten the creattion variable setting of squares (use each)
  def initialize 
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
    puts "  1   2   3 "
    puts "a  #{@a1} | #{@a2} | #{@a3} "
    puts "  --- --- ---"
    puts "b  #{@b1} | #{@b2} | #{@b3} "
    puts "  --- --- ---"
    puts "c  #{@c1} | #{@c2} | #{@c3} "
  end
end

class Player
  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def get_sq_choice
    puts "#{@name.capitalize}, what sq do you pick?"
    sq_choice = gets.chomp
  end
end

game = GameBoard.new()
player1 = Player.new("player1", "x")
player2 = Player.new("player2", "o")
game.print_board
player1.get_sq_choice