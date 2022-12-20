require 'minitest/autorun'
require_relative 'main.rb'
$count = 0


class MyTest < Minitest::Test
  def setup
    puts "setup #{$count+=1}"
  end

  def test_send_int_value
    for value in 1..3 do
        assert (y 1) == 0.42
    end
  end
  def test_send_int_value_2
    for value in 1..3 do
        assert (y 1) == 0.42
    end
  end
end