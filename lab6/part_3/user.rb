require_relative 'main'

y1 = Y1.new 0, 2
y2 = Y2.new(-1, 1)

puts "\t================================ OUTPUT BEGIN ================================"
puts '============= MINMAX for (x - 1)/(x + 2) ============'
puts y1.minmax
puts '============= MINMAX for sin(x / 2 - 1) ============'
puts y2.minmax
puts "\t================================ OUTPUT with block & proc & lambda ================================"

puts '============= MINMAX block for (x - 1)/(x + 2) ============'
puts y1.my_minmax { |x| ((x - 1) / (x + 2)) }
puts '=============MINMAX Proc for sin(x / 2 - 1) ============'
puts y2.my_minmax(&proc { |x| Math.sin(x / 2 - 1) })
puts '============ MINMAX Lambda ============'

func = ->(x) { Math.sin(x / 2 - 1) }
puts y2.l_minmax func
puts "\t================================ OUTPUT END ================================"
