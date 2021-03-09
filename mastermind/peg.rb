class Peg
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def ==(peg)
    @color == peg.color
  end
end