# Odin Project Tic Tac Toe Game
# by Joseph Frey

# The Game class has methods for starting and finishing the game, and records number of games played.

class Game
  attr_accessor :player1, :player2, :current_turn
  attr_reader :name

  @@game_count = 0

  def initialize
    @name = 'Tic-Tac-Toe'
    @turn_count = 1
    @@game_count += 1
  end

  def name_players
    print 'Player 1 Enter Name: '
    @player1 = Player.new(gets.chomp)
    puts
    print 'Player 2 Enter Name: '
    @player2 = Player.new(gets.chomp)
    puts [@player1, @player2]
    self.current_turn = self.player1
  end

  def player_move(board)
    print "#{player1} pick a box: "
    board.add_x(gets.chomp.to_sym)
  end

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

  def display
    puts '     a    b     c    '
    puts " 1  #{@grid[:a1]}  |  #{@grid[:a2]}  |  #{@grid[:a3]} "
    print '   ----------------'
    puts
    puts " 2  #{@grid[:b1]}  |  #{@grid[:b2]}  |  #{@grid[:b3]} "
    print '   ----------------'
    puts
    puts " 3  #{@grid[:c1]}  |  #{@grid[:c2]}  | #{@grid[:c3]} "
  end
end

# Player instances hold a player's name and has a method for playing a turn

class Player
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
end

# Instances of the Turn class pass user turn data to the board instance.

class Turn
  def initialize; end
end
