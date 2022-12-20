require_relative 'main'

print "Input strings, for end type '#': "
str = ''
strings = []
while str != '#'
  strings.push(str)
  str = gets.chomp
end
solution = Solution.new(strings)
puts '============= Output ================'
puts solution.make_correct
