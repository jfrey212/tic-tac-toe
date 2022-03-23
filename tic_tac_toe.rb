# Odin Project Tic Tac Toe Game
# by Joseph Frey

# The Game class has methods for starting and finishing the game, and records number of games played.

class Game
  attr_reader :number_of_games, :name

  def initialize; end

  def player_move; end

  def add_player_move; end
end

# The board class draws the tic-tac-toe board and can add X or O to a cell in the board.

class Board
  def initialize
    @grid = { a1: ' ', a2: ' ', a3: ' ',
              b1: ' ', b2: ' ', b3: ' ',
              c1: ' ', c2: ' ', c3: ' ' }
  end

  def add_x(cell)
    @grid[cell] = 'X'
  end

  def add_o(cell)
    @grid[cell] = 'O'
  end

  def display_board
    puts " #{@grid[:a1]}  |  #{@grid[:a2]}  |  #{@grid[:a3]} "
    15.times { print '-' }
    puts
    puts " #{@grid[:b1]}  |  #{@grid[:b2]}  |  #{@grid[:b3]} "
    15.times { print '-' }
    puts
    puts " #{@grid[:c1]}  |  #{@grid[:c2]}  | #{@grid[:c3]} "
  end
end

# Player instances hold a player's name and has a method for playing a turn

class Player
  attr_accessor :name

  def initialize; end
end

# Instances of the Turn class pass user turn data to the board instance.

class Turn
  def initialize; end
end
