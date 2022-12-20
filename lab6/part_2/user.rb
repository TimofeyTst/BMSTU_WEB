# frozen_string_literal: true

require_relative 'main'
require_relative 'main2'

print 'Введите точность: '
ep = gets.to_f

solve.each do |sum|
    puts "Sum: #{sum}"
  end
  puts "\t================================ Output ep = 0.01 ================================"
  solve.ep = 0.01
  
  solve.each_with_index do |sum, index|
    puts "Sum: #{sum} iteration: #{index + 1} "
  end
  puts "\t================================ Output ep = 0.001 ================================"
  solve.ep = 0.001
  
  solve.each_with_index do |sum, index|
    puts "Sum: #{sum} iteration: #{index + 1} "
  end
  
puts "\t================================ OUTPUT BEGIN ================================"
puts "Lazy Enumerator sum ep #{ep} => #{Solution2.show(ep)}"
puts "Lazy Enumerator sum ep 0.01 => #{Solution2.show(0.01)}"
puts "Lazy Enumerator sum ep 0.001 => #{Solution2.show(0.001)}"
puts "\t================================ OUTPUT END ================================"
