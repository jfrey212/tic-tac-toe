# Odin Project Tic Tac Toe Game
# by Joseph Frey

# The Game class has methods for starting and finishing the game, and records number of games played.

class Game
  def initialize
    @player1 = ''
    @player2 = ''
    @game_over = false
    @winner = ''
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

  def run_game
    current_turn = 0
    turn_count = 1
    grid_choice = ""
    loop do
      system('clear')
      puts "Turn #{turn_count}"
      @board.display
      puts
      if current_turn.zero?
        print "\n#{@player1.name} pick a box: "
        grid_choice = gets.chomp
        next unless grid_choice =~ /[abc][123]/
        next unless @board.grid[grid_choice.to_sym] == " "
        @board.add_x(grid_choice.to_sym)
        current_turn = 1
        turn_count += 1
      elsif current_turn == 1
        print "\n#{@player2.name} pick a box: "
        grid_choice = gets.chomp
        next unless grid_choice =~ /[abc][123]/
        next unless @board.grid[grid_choice.to_sym] == " "
        @board.add_o(grid_choice.to_sym)
        current_turn = 0
        turn_count += 1
      end
      system('clear')
      @board.display
      victory_check
      if @game_over == true
        break
      elsif turn_count == 9
        break
      end
    end
    system('clear')
    @board.display
    puts
    if turn_count == 9
      puts 'Tie game'
    else
      puts "The winner is #{@winner}"
    end
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
        @game_over = true
        @winner = @player1.name
        break
      elsif check.uniq.length == 1 && check.uniq[0] == 'O'
        @game_over = true
        @winner = @player2.name
        break
      end
    end
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
  current_game = Game.new
  current_game.name_players
  current_game.run_game
  puts 'Play again? (y/n)'
  answer = gets.chomp
  if answer == 'y'
    next
  else
    break
  end
end
