# frozen_string_literal: true

# This class is responsible for checking is the elements before first negative sorted from min to max.
class Solution
  def self.posled?(arr)
    new = arr.take_while { |el| el >= 0 }
    new.empty? || arr == new ? false : new == new.sort
  end
end
