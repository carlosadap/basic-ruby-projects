require_relative 'code'

class Game
  attr_reader :secret_code, :guess_code

  def initialize(code_size = 4, max_turns = 2)
    @turns_code = []
    @code_size = code_size
    @max_turns = max_turns
    @colors = %w[orange blue yellow red]
  end

  def valid_guess?(array_colors)
    color_match = array_colors.all? { |color| @colors.include?(color) }
    qtt_match = array_colors.length == @code_size
    color_match && qtt_match
  end

  def ask_guess
    puts 'What is your guess?'
    puts "Valid colors are: #{@colors}"
    puts 'Enter four valid colors, separated by comma'
    guess = gets.chomp.split(',')
    until valid_guess?(guess)
      print "\n Not a valid guess \n"
      guess = ask_guess
    end
    guess
  end

  def create_secret_code
    random_colors = []
    @code_size.times { random_colors << @colors.sample }
    @secret_code = Code.new(random_colors)
  end

  def create_guess_code(colors_array)
    Code.new(colors_array)
  end

  def give_feedback(code)
    check_pegs = code.check_pegs(@secret_code)
    black_pins, white_pins = check_pegs
    puts 'Your score so far is:'
    puts "Black pins: #{black_pins}"
    puts "White pins: #{white_pins}"
    display_guesses
  end

  def display_guesses
    puts "Your guesses so far:"
    @turns_code.each do |code|
      code.pegs.each { |peg| print "#{peg.color}\t" }
      puts ""
    end
  end

  def play_turn
    guess = create_guess_code(ask_guess)
    @turns_code << guess
    @game_on = false if guess.same_code?(@secret_code) || out_of_turns
    give_feedback(guess)
    @secret_code.pegs.each { |peg| puts peg.color }
  end

  def out_of_turns
    @turns_code.length >= @max_turns
  end

  def run
    create_secret_code
    @game_on = true
    play_turn while @game_on
    puts "You just made the max number of attempts (#{@max_turns}) and didn't find the secret code" if out_of_turns
    puts "You won!"
  end
end
