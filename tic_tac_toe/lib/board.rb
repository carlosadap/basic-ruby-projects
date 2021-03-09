class Board
  attr_accessor :grid

  def initialize(length)
    @grid = Array.new(length) { |sub_array| sub_array = Array.new(length, :·) }
  end

  def is_pos_available?(pos)
    row, col = pos
    grid[row][col] == :-
  end

  def size
    @grid.length
  end

  def display
    print "  -------------\n"
    grid.each_with_index do |col, idx|
      
      print "#{idx} | "
      col.each { |val| print "#{val} | " }
      print "\n  -------------"
      puts ""
    end
    print " "
    (0...grid.length).each { |num| print "   #{num}"}
    print "\n"
  end
end