require_relative 'peg.rb'

class Code
  def initialize(code_size)
    @pegs = (0...code_size).map { |position| Peg.new(position) }
  end
end