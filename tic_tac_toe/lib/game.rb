require_relative 'player.rb'
require_relative 'board.rb'

class Game
  attr_reader :players, :symbols, :board, :n_players

  def initialize(length = 3, n_players = 2)
    # @players = [Player.new("Carlos", :X), Player.new("Jown", :O)]
    @players = []
    @n_players = n_players
    @current_player
    @board = Board.new(length)
    @game_on = false
  end

  def create_player
    puts "What is the name of the player?"
    name = gets.chomp
    puts "What the symbol of the player?"
    symbol = gets.chomp.to_sym
    if is_valid_symbol?(symbol)
      new_player = Player.new(name, symbol.to_sym)
      @players << new_player
      puts "The player #{name} with the symbol #{symbol} was created"
    else
      puts "The player #{name} with the symbol #{symbol} was not created because the symbol #{symbol} already exists, try another symbol"
    end
  end

  def is_valid_symbol?(check_symbol)
    players.none? { |player| player.symbol == check_symbol }
  end

  def player_creation
    until @players.length == n_players
      create_player
    end
  end

  def play_turn
    @board.display
    position = ask_position
    until valid_position?(position)
      puts "#{position} is not a valid position, please try again"
      position = ask_position
    end
    assign_play(position)
  end

  def assign_play(position)
    row, col = position
    @board.grid[row][col] = @current_player.symbol
  end

  def ask_position
    puts "It's #{@current_player.name}'s' turn"
    puts "Where do you want to play? (Position separated by comma)"
    gets.chomp.split(",").map { |ele| ele.to_i }
  end

  def valid_position?(position)
    row, col = position
    return false if row >= @board.grid.length || col >= @board.grid.length
    return true if @board.grid[row][col] == :·
    false
  end

  def win?(symbol)
    @board.win?(symbol)  
  end

  def next_player
    old_idx = @players.index(@current_player)
    new_idx = ( old_idx + 1 ) % @players.length
    @current_player = @players[new_idx]
  end

  def run
    player_creation
    @current_player = @players.sample
    @game_on = true
    while @game_on
      play_turn
      if win?(@current_player.symbol)
        @game_on = false
      else
        next_player
      end
    end

    puts "Game ended, #{@current_player.name} won"
    @board.display
  end
end

