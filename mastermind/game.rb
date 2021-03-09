require_relative 'code.rb'

class Game
  def initialize(code_size = 4, max_turns = 12)
    @turns_code = []
    @code_size = code_size
    @max_turns = max_turns
  end

  def run
    @secret_code = Code.new(@code_size)
  end
end