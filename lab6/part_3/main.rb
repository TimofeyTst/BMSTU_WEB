class Solution
  include Enumerable

  def initialize(a = 0, b = 5, step = 0.01)
    @a = a
    @b = b
    @step = step
  end

  def y(x)
    (x**2)
  end

  def l_minmax(func, a = @a, b = @b)
    arr = []
    while a <= b
      arr.push func.call(a)
      a += @step
    end
    arr.minmax
  end

  def my_minmax(a = @a, b = @b)
    arr = []
    while a <= b
      arr.push yield a
      a += @step
    end
    arr.minmax
  end

  def each
    x = @a
    while x <= @b
      yield y(x)
      x += @step
    end
  end
end

class Y1 < Solution
  def y(x)
    (x - 1) / (x + 2)
  end
end

class Y2 < Solution
  def y(x)
    Math.sin(x / 2 - 1)
  end
end

