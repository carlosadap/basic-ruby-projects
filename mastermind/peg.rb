class Peg
  attr_reader :color, :position

  def initialize(color, position)
    @color = color
    @position = position
  end

  def ==(other)
    @color == other.color
  end
end
