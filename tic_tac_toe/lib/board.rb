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

  def win_row?(symbol)
    @grid.any? { |row| row.uniq.count == 1 && row.first == symbol }
  end

  def win_column?(symbol)
    (0...@grid.length).each do |idx_col|
      column_arr = (0...@grid.length).map do |idx_row|
        @grid[idx_row][idx_col]
      end
    
      return true if column_arr.all? { |ele| ele == symbol }
    end

    false
  end

  def win_diago?(symbol)
    diago_arr = (0...@grid.length).map do |idx|
      @grid[idx][idx]
    end

    inv_diago_arr = (0...@grid.length).map do |idx|
      @grid[@grid.length-1-idx][idx]
    end

    (diago_arr.uniq.count == 1 && diago_arr.first == symbol) || inv_diago_arr.uniq.count == 1 && inv_diago_arr.first == symbol
  end

  def win?(symbol)    
    win_row?(symbol) || win_column?(symbol) || win_diago?(symbol)
  end
end