class Player
  attr_reader :mark, :name

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def get_sq_choice
    puts "#{@name}, what sq do you pick? Use the format: a1"
    # Return players sq choice
    gets.chomp
  end
end