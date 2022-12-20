class Solution
  attr_accessor :iterations, :sum

  def initialize(eps = 0.1)
    @eps = eps
    @iterations = 0
    @sum = 0
    rek
  rescue SystemStackError
    puts "\t!!!#{SystemStackError}: Stack Overflow"
  end

  def count(eps)
    initialize eps
  end

  def rek(k = 1, pred_sum = 0)
    @sum += 1.0 / (k * (k + 1) * (k + 2) * (k + 3))
    @iterations += 1
    if (@sum - pred_sum).abs < @eps
      @sum
    else
      rek k + 1, @sum
    end
  end
end
