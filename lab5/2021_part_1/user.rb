require_relative "main.rb"

begin
  print 'Input value: '
  x = gets.to_i
  result = y x
  puts "\tResult = #{result}"
rescue Math::DomainError
  puts 'Numerical argument is out of domain'
rescue StandardError
  puts 'Error: I dont know what to do with this'
end
