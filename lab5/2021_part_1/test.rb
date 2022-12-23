# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'
$count = 0

class MyTest < Minitest::Test
  def setup
    puts "setup #{$count += 1}"
  end

  def test_send_int_value
    (1..3).each do |_value|
      assert (y 1) == 0.42
    end
  end

  def test_send_int_value_2
    (1..3).each do |_value|
      assert (y 1) == 0.42
    end
  end
end
