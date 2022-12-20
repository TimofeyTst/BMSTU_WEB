require_relative 'main'

print 'Input array: '
solution = Solution.new(gets.split.map(&:to_f))

if solution.posled?
  puts "Yes, posled: #{solution.arr_new}"
else
  puts 'No'
end
