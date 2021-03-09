class Peg
  attr_reader :color, :position

  def initialize(color, position)
    @color = color
    @position = position
  end

  def ==(peg)
    @color == peg.color
  end  
end