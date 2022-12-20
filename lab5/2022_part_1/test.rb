require 'minitest/autorun'
require_relative 'main'

# Test class
class MyTest < Minitest::Test
  def test_error
    result = (Solution.calculate 1, 5, 2)
    puts "result == #{result}"
    assert (Solution.calculate 1, 5, 2) == 'ZeroDivisionError'
  end

  def test_float_values
    assert (Solution.calculate 1.0, 5.0, 2.0).truncate == -1
  end

  def test_values
    result = (Solution.calculate 1.0, 5.0, 2.0).truncate
    puts "result == #{result}"
    assert (Solution.calculate 6.0, 7.0, 1.0).truncate == 2
  end
end
