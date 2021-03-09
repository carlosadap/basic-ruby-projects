require_relative 'code.rb'

class Game
  attr_reader :secret_code, :guess_code

  def initialize(code_size = 4, max_turns = 12)
    @turns_code = []
    @code_size = code_size
    @max_turns = max_turns
    @colors = ['black', 'blue', 'white', 'red']
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
      print "\n Not a valid guess \n"
      guess = ask_guess
    end
    guess
  end

  def create_secret_code
    random_colors = []
    @code_size.times { random_colors << @colors.sample}
    @secret_code = Code.new(random_colors)
  end

  def create_guess_code(colors_array)
    @guess_code = Code.new(colors_array)
  end

  def run
    create_secret_code
    guess = ask_guess
    create_guess_code(guess)
  end
end