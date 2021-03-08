require_relative 'player.rb'
require_relative 'board.rb'

class Game
  attr_reader :players, :symbols, :board

  def initialize(length, n_players = 2)
    @players = []
    @board = Board.new(length)
  end

  def create_player(name, symbol)
    if is_valid_symbol?(symbol.to_sym)
      new_player = Player.new(name, symbol.to_sym)
      players << new_player
      puts "The player #{name} with the symbol #{symbol} was created"
    else
      puts "The player #{name} with the symbol #{symbol} was not created because the symbol #{symbol} already exists"
    end
  end

  def is_valid_symbol?(check_symbol)
    players.none? { |player| player.symbol == check_symbol }
  end
end