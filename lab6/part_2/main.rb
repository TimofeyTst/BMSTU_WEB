class Solution
  include Enumerable
  attr_accessor :iterations, :sum, :ep

  def initialize(ep = 0.1)
    @ep = ep
    @iterations = 0
    @sum = 0
  end
  
  #1..infinity take while
  def each
    puts 'METHOD each'
    @iterations = 0
    @sum = 0
    pred_sum = 2 * @ep

    while (@sum - pred_sum).abs > @ep
      @iterations += 1
      pred_sum = @sum
      @sum += 1.0 / (@iterations * (@iterations + 1) * (@iterations + 2) * (@iterations + 3))
      yield @sum
    end
  end

end
