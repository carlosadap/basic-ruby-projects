class Peg
  attr_reader :color, :position

  def initialize(position, color = nil)
    @colors = ['black', 'blue', 'white', 'red']
    @color = color || @colors.sample
  end

  def ==(peg)
    @color == peg.color
  end  
end