class Game
  def initialize(width = 3, player1_name = "Player1", player2_name = "Player2")
    @player1 = Player.new(player1_name, "x")
    @player2 = Player.new(player2_name, "o")
    @board = GameBoard.new(width)
  end
end