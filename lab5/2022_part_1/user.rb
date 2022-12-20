require_relative 'main'

print "y = cos(x + 3.1 * z) / tg(x / r)\n\tInput x: "
x = gets.to_f
print "\tInput z: "
z = gets.to_f
print "\tInput r: "
r = gets.to_f

puts "x = #{x} #{x.class}\tz = #{z} #{z.class}\tr = #{r} #{r.class}"

result = Solution.calculate x, z, r
puts "Result = #{result}"
