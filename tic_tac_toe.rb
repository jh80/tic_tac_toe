require "./game_board.rb"

class Player
  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def get_sq_choice
    puts '#{@name.capitalize}, what sq do you pick?'
    sq_choice = gets.chomp
  end
end

game = GameBoard.new()
player1 = Player.new('player1', 'x')
player2 = Player.new('player2', 'o')
game.print_board
player1.get_sq_choice