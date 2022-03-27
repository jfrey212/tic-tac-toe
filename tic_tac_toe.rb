# Odin Project Tic Tac Toe Game
# by Joseph Frey

# The Game class has methods for starting and finishing the game, and records number of games played.

class Game
  def initialize
    @player1 = ''
    @player2 = ''
    @is_winner = false
    @winner = ''
    @current_turn = 0
    @turn_count = 1
    @board = Board.new
  end

  def name_players
    print 'Player 1 Enter Name: '
    @player1 = Player.new(gets.chomp)
    puts
    print 'Player 2 Enter Name: '
    @player2 = Player.new(gets.chomp)

    puts @player1.name
    puts @player2.name
  end

  def next_turn
    system('clear')
    puts "Turn #{@turn_count}"
    @board.display
    if @current_turn.zero?
      print "\n#{@player1.name} pick a box: "
      @board.add_x(gets.chomp.to_sym)
      @current_turn = 1
      @turn_count += 1
    elsif @current_turn == 1
      print "\n#{@player2.name} pick a box: "
      @board.add_o(gets.chomp.to_sym)
      @current_turn = 0
      @turn_count += 1
    end
    system('clear')
    @board.display
  end

  def victory_check
    win1 = [@board.grid[:a1], @board.grid[:a2], @board.grid[:a3]]
    win2 = [@board.grid[:b1], @board.grid[:b2], @board.grid[:b3]]
    win3 = [@board.grid[:c1], @board.grid[:c2], @board.grid[:c3]]
    win4 = [@board.grid[:a1], @board.grid[:b1], @board.grid[:c1]]
    win5 = [@board.grid[:a2], @board.grid[:b2], @board.grid[:c2]]
    win6 = [@board.grid[:a3], @board.grid[:b3], @board.grid[:c3]]
    win7 = [@board.grid[:a1], @board.grid[:b2], @board.grid[:c3]]
    win8 = [@board.grid[:c1], @board.grid[:b2], @board.grid[:a3]]

    wins = [win1, win2, win3, win4, win5, win6, win7, win8]

    wins.each do |check|
      if check.uniq.length == 1 && check.uniq[0] == 'X'
        @is_winner = true
        @winner = 'player 1'
        break
      elsif check.uniq.length == 1 && check.uniq[0] == 'O'
        @is_winner = true
        @winner = 'player 2'
        break
      else
        @winner = 'no winner yet'
      end
    end

    puts @is_winner
    puts @winner
  end
end

# The board class draws the tic-tac-toe board and can add X or O to a cell in the board.

class Board
  attr_reader :grid

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

  private

  attr_writer :grid
end

# Player instances hold a player's name and has a method for playing a turn

class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# Game logic - run inside a loop until quit

puts 'Welcom to Tic-Tac-Toe'

loop do
  puts 'Press any key to begin'
  game = Game.new
  game.name_players
end
