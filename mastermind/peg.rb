class Peg
  attr_reader :position
  attr_accessor :color

  def initialize(color, position)
    @color = color
    @position = position
  end

  def same_position?(other)
    @position == other.position
  end

  def same_color?(other)
    @color == other.color
  end

  def same_peg?(other)
    same_color?(other) && same_position?(other)
  end
end
