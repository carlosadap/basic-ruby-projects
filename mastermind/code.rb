require_relative 'peg.rb'

class Code
  def initialize(code_size = 4)
    @pegs = [ ]
    @colors = ['black', 'blue', 'white', 'red']
    code_size.times { @pegs << Peg.new(@colors.sample) }
  end
end