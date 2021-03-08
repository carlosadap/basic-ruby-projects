require_relative 'player.rb'
require_relative 'board.rb'

class Game
  attr_reader :players, :symbols, :board, :n_players

  def initialize(length, n_players = 2)
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
    position = ask_position
    until valid_position?(position)
      ask_position
    end
  end

  def ask_position
    puts "Where do you want to play?"
    gets.chomp
  end

  def valid_position?(position)
    row, col = position
    return false if row >= length || col >= length
    return true if @grid[row][col] == :·
    false
  end

  def run
    player_creation
    @current_player = @players.sample
    @game_on = true
    while game_on?
      play_turn
      if win?
        @game_on = false
      end
    end
  end
end