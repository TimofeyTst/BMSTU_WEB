# frozen_string_literal: true

# Solution 2
class Solution2
  def self.go_lazy(value, debug: false)
    Enumerator::Lazy.new(0..Float::INFINITY) do |yielder, idx|
      puts "Value: #{value} iteration: #{idx}" if debug
      value += 1.0 / ((idx + 1) * (idx + 1 + 1) * (idx + 1 + 2) * (idx + 1 + 3))
      yielder << value
    end
  end

  def self.show (ep = 0.01, debug: false)
    pred_sum = 0
    go_lazy(0, debug: debug).take_while do |sum|
      flag = (sum - pred_sum).abs
      pred_sum = sum
      flag > ep
    end.inject(:+)
  end
end

