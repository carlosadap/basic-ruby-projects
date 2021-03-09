class Code
  def initialize(code_size)
    @pegs = [ ]
    code_size.times { @pegs << Peg.new() }
  end
end