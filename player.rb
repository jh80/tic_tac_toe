class Player
  attr_reader :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def get_sq_choice
    puts "#{@name.capitalize}, what sq do you pick?"
    sq_choice = gets.chomp
  end
end