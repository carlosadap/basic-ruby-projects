require_relative 'peg'
require 'byebug'

class Code
  attr_reader :pegs

  def initialize(colors_array)
    @pegs = colors_array.each_with_index.map { |color, idx| Peg.new(color, idx) }
  end

  def same_code?(other)
    @pegs.each_with_index { |peg, idx| return false unless peg.same_peg?(other.pegs[idx]) }
    true
  end

  def check_pegs(other)
    black_pins = count_black_pins(other)
    white_pins = count_white_pins(other)
    [black_pins, white_pins]
  end

  def count_black_pins(other)
    count = 0
    pegs.each_with_index { |peg, idx| count += 1 if peg.same_peg?(other.pegs[idx]) }
    count
  end

  def create_dummy_pegs(pegs)
    pegs.map(&:clone)
  end

  def remove_black_pins(pegs, other)
    pegs.each_with_index do |peg, idx|
      if peg.same_peg?(other[idx])
        peg.color = 'blank'
        other[idx].color = 'blank'
      end
    end
  end

  def check_white_pegs(pegs, other)
    count = 0
    pegs.each_with_index do |peg1, idx1|
      other.each_with_index do |peg2, idx2|
        same_color = peg1.same_color?(peg2) && peg1.color != 'blank'
        different_position = idx1 != idx2
        next unless same_color && different_position

        peg1.color = 'blank'
        peg2.color = 'blank'
        count += 1
      end
    end
    count
  end

  def count_white_pins(other)
    dummy_pegs = create_dummy_pegs(pegs)
    dummy_secret_pegs = create_dummy_pegs(other.pegs)
    remove_black_pins(dummy_pegs, dummy_secret_pegs)
    check_white_pegs(dummy_pegs, dummy_secret_pegs)
  end
end
