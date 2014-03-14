class TowersOfHanoi
  attr_accessor :pegs

  def initialize
    @peg1 = [1,2,3,4]
    @peg2 = []
    @peg3 = []

    @pegs = [@peg1,@peg2,@peg3]
  end

  def move_disk(from, to)
    raise 'empty peg' if @pegs[from].empty?

    if @pegs[to].empty? || (@pegs[from].first < @pegs[to].first)
      @pegs[to].unshift(@pegs[from].shift)
    else
      raise 'invalid move'
    end

  end

  def won?
    @pegs == [[], [], [1, 2, 3, 4] ]
  end

  def render
    output = ''
    @pegs.each do |peg|
      peg.each do |disc|
        output << "#{disc}"
      end
      output << "\n"
    end
    output
  end
end