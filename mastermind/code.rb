require_relative 'peg.rb'

class Code
  def initialize(colors_array)
    @pegs = colors_array.each_with_index.map { |color, idx| Peg.new(color, idx) }
  end
end