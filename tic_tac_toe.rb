# Odin Project Tic Tac Toe Game
# by Joseph Frey

class Game
  attr_reader :number_of_games, :name

  def initialize

  end

  def get_move

  end

  def add_player_move

  end
end

class Board

  def initialize
    @grid = {a1: " ", a2: " ", a3: " ",
             b1: " ", b2: " ", b3: " ",
             c1: " ", c2: " ", c3: " "}
  end

  def add_x(cell)
    @grid[cell] = "X"
  end

  def add_o(cell)
    @grid[cell] = "O"
  end

  def display_board
    puts " #{@grid[:a1]}  |  #{@grid[:a2]}  |  #{@grid[:a3]} "
    15.times {print "-"}
    puts
    puts " #{@grid[:b1]}  |  #{@grid[:b2]}  |  #{@grid[:b3]} "
    15.times {print "-"}
    puts
    puts " #{@grid[:c1]}  |  #{@grid[:c2]}  | #{@grid[:c3]} "
  end
end
