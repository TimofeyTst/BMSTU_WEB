# frozen_string_literal: true

require_relative 'main'
begin
  print "Example: if file name is 'text.txt' just input 'text'\nInput file name without format: "
  file_line_reverse(gets.chomp)
  puts "Success! check file 'output.txt'"
rescue StandardError => e
  puts e.message
end
