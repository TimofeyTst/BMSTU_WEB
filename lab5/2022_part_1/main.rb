# frozen_string_literal: true

# tg(x/r)
class Solution
  include Math

  def self.calculate(x, z, r)
    raise 'ZeroDivisionError' if x.zero? || Math.tan(x / r).zero?

    (Math.cos(x + 3.1 * z) / Math.tan(x / r)).floor(2)
  rescue StandardError => e
    e.message
  end
end
