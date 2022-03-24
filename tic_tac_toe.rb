
# Odin Project Tic Tac Toe Game
# by Joseph Frey

# The Game class has methods for starting and finishing the game, and records number of games played.

class Game
  attr_accessor :player1, :player2, :current_turn, :turn_count, :board

  def initialize
    self.turn_count = 0
    self.board = Board.new
  end

  def name_players
    print 'Player 1 Enter Name: '
    @player1 = Player.new(gets.chomp)
    puts
    print 'Player 2 Enter Name: '
    @player2 = Player.new(gets.chomp)
  end

  def next_turn
    system("clear")
    puts current_turn
    self.board.display
    if self.current_turn == 0
      print "#{player1.name} pick a box: "
      board.add_x(gets.chomp.to_sym)
      self.current_turn = 1
    elsif self.current_turn == 1
      print "#{player2.name} pick a box: "
      board.add_o(gets.chomp.to_sym)
      self.current_turn = 0
    end
  end

  def start_game
    name_players
    self.current_turn = 0
  end
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
    puts '     1    2     3    '
    puts " a  #{@grid[:a1]}  |  #{@grid[:a2]}  |  #{@grid[:a3]} "
    print '   ----------------'
    puts
    puts " b  #{@grid[:b1]}  |  #{@grid[:b2]}  |  #{@grid[:b3]} "
    print '   ----------------'
    puts
    puts " c  #{@grid[:c1]}  |  #{@grid[:c2]}  | #{@grid[:c3]} "
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

g = Game.new
g.start_game
g.next_turn
