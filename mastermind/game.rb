require_relative 'code.rb'

class Game
  def initialize(max_turns = 12)
    @turns = []
    @max_turns = max_turns
    @secret_code = Code.new()
  end
end