# frozen_string_literal: true

class Numeric
  def sqrt
    Math.sqrt self
  end
end

def y(x)
  numerator = Math.sin((x**3 + x**2).abs)**3
  denominator = (x**3 + x**2 - x)**2 + Math::PI
  result = (numerator / denominator)
  result = result.sqrt.floor(2)
  yield result if block_given?
  result
end
