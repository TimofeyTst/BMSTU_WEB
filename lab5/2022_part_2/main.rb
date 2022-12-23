# frozen_string_literal: true

# This class is responsible for checking is the elements before first negative sorted from min to max.
class Solution
  attr_accessor :arr_new, :arr

  def initialize(arr)
    @arr = arr
    @arr_new = []
    @was_negative = false
    @arr.each_with_index do |value, _index|
      if value.negative?
        @was_negative = true
        break
      else
        @arr_new.push(value)
      end
    end
  end

  def posled?(arr_new = @arr_new)
    if arr_new.any? && @was_negative
      arr_new == arr_new.sort
    else
      false
    end
  end
end

# arr = []
# 15.times do
#   arr.push((Random.rand(2700)/27-40).floor(2))
# end
# p "#{arr}"
# arr = [-40, 30, -23, -33, 8, 10, 18, -18, 16, 18, 32, 33, 22, 16, -7]
# arr = [1, 5, 16, 3, 17, 18, 10]
# solution = Solution.new(arr)
# puts solution.posled?
