require_relative 'peg'

class Code
  attr_reader :pegs

  def initialize(colors_array)
    @pegs = colors_array.each_with_index.map { |color, idx| Peg.new(color, idx) }
  end

  def same_code?(other)
    @pegs.each_with_index { |peg, idx| return false unless peg.same_peg?(other.pegs[idx]) }
    true
  end
end
