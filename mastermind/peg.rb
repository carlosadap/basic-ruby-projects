class Peg
  attr_reader :color

  def initialize(color = nil)
    @colors = ['black', 'blue', 'white', 'red']
    @color = color || @colors.sample
  end

  def ==(peg)
    @color == peg.color
  end
end