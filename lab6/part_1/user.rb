# frozen_string_literal: true

require_relative 'main'

print 'Введите точность: '
solve = Solution.new(ep = gets.to_f)
print 'Сколько раз уменьшать точность? '
count = gets.to_i
i = 0

puts "\t================================ OUTPUT BEGIN ================================"
count.times do
  solve.count ep
  puts "#{i += 1}) With ep = #{ep}\tTotal sum: #{solve.sum}, Iterations: #{solve.iterations}"
  ep /= 10
end
puts "\t================================ OUTPUT END ================================"
