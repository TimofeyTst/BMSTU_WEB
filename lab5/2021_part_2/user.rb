require_relative 'main'

mas = []
mas = ['Зима Тмт Холода', 'Одинокие дома', 'Моря, города, все как будто изо льда', 'Лмблр Птншт',
       'Но скоро рр без нас снег расстает и тогда...']
puts "Напишите '#' для завершения"

# str = gets.chomp
# while str != '#'
#   mas.push(str)
#   str = gets.chomp
# end

result = without_consonant mas

puts "\nMas Before"
mas.each do |el|
  puts el
end

puts "\nMas After"
result[:array].each do |el|
  puts el
end

puts "Всего согласных слов: #{result[:total_words]}"
