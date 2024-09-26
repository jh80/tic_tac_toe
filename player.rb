class Player
  attr_reader :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def get_sq_choice
    puts "#{@name}, what sq do you pick?"
    # Return players sq choice
    gets.chomp
  end
end