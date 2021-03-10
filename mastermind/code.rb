require_relative 'peg'

class Code
  attr_reader :pegs

  def initialize(colors_array)
    @pegs = colors_array.each_with_index.map { |color, idx| Peg.new(color, idx) }
  end

  def same_code?(other)
    @pegs.each_with_index { |peg, idx| return false unless peg.same_peg?(other.pegs[idx]) }
    true
  end

  def count_black_pins(other)
    count = 0
    @pegs.each_with_index { |peg, idx| count += 1 if peg.same_peg?(other.pegs[idx]) }
    count
  end

  def count_white_pins(other)
    count = 0
    dummy_code = @pegs.map(&:clone)
    dummy_secret_code = other.pegs.map(&:clone)
    #change blacks
    dummy_code.each_with_index do |peg_1, idx_1|
      # binding.pry
      dummy_secret_code.each_with_index do |peg_2, idx_2|
        same_color = peg_1.same_color?(peg_2) && peg_1.color != 'check'
        different_position = !peg_1.same_position?(peg_2) && idx_1 != idx_2
        if same_color && different_position
          peg_1.color = 'check'
          peg_2.color = 'check'
          count += 1
        end
      end
    end
    count
  end
end
