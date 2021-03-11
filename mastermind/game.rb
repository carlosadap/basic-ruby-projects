require_relative 'code'

class Game
  attr_reader :secret_code, :guess_code

  def initialize(code_size = 4, max_turns = 12)
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

  def remaining_turns
    "Remaining turns: #{@max_turns - @turns_code.length}\n"
  end

  def display_guesses
    print remaining_turns
    print "Your guesses so far:\n"
    @turns_code.each do |turn|
      turn[:guess].pegs.each { |peg| print "#{peg.color}\t " }
      print "  | Black pins: #{turn[:black_pins]} - White pins: #{turn[:white_pins]}\n\n"
    end
  end

  def turn_resolution(guess)
    black_pins, white_pins = guess.check_pegs(@secret_code)
    { guess: guess, black_pins: black_pins, white_pins: white_pins }
  end

  def play_turn
    guess = create_guess_code(ask_guess)
    @turns_code << turn_resolution(guess)
    @game_on = false if guess.same_code?(@secret_code) || out_of_turns
    display_guesses
    # @secret_code.pegs.each { |peg| puts peg.color }
  end

  def out_of_turns
    @turns_code.length >= @max_turns
  end

  def display_lose_message
    puts "You just made the max number of attempts (#{@max_turns}) and didn't find the secret code #{@secret_code}"
  end

  def run
    create_secret_code
    @game_on = true
    play_turn while @game_on
    display_lose_message if out_of_turns
    puts 'You won!'
  end
end
