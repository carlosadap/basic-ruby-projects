class Board
  attr_accessor :grid

  def initialize(length)
    @grid = Array.new(length) { |sub_array| sub_array = Array.new(length, :·) }
  end

  def is_pos_available?(pos)
    row, col = pos
    grid[row][col] == :-
  end

  def display
    print "-------------\n"
    grid.each do |col|
      print "| "
      col.each { |val| print "#{val} | " }
      print "\n-------------"
      puts ""
    end
  end
end