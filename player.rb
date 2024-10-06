# frozen_string_literal: true

# Player manages the turn of a player

class Player
  attr_reader :mark, :name

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def get_sq_choice
    puts "#{@name}, what sq do you pick?"
    # Return players sq choice
    gets.chomp
  end

  def take_turn(board)
    loop do
      choice = get_sq_choice
      break if board.execute_pick(choice, self)
    end
  end
end
