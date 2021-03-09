require_relative 'code.rb'

class Game
  def initialize(code_size = 4, max_turns = 12)
    @turns_code = []
    @code_size = code_size
    @max_turns = max_turns
    @colors = ['black', 'blue', 'white', 'red']
  end

  def guess_code(array_pegs)
    core
  end

  def valid_guess?(array_colors)
    color_match = array_colors.all? { |color| @colors.include?(color) }
    qtt_match = array_colors.length == @code_size
    return color_match && qtt_match
  end

  def ask_guess
    puts "What is your guess?"
    puts "Valid colors are: #{@colors}"
    puts "Enter four valid colors, separated by comma"
    guess = gets.chomp.split(",")
    until valid_guess?(guess)
      guess = ask_guess
    end
    guess
  end

  def run
    @secret_code = Code.new(@code_size)
    guess = ask_guess
  end
end