# frozen_string_literal: true

Consonant = 'бвгджзклмнпрстфхцчшщБВГДЖЗКЛМНПРСТФХЦЧШЩ'

# Return Array
def without_consonant(mas)
  new_mas = []
  consonant_words = 0

  mas.each do |string|
    str = ''
    print "Строка '#{string}' "

    string.split.each do |el|
      if el.delete(Consonant).empty?
        print "#{el} => #{el.delete(Consonant).empty?}, Всего слов: #{consonant_words += 1}\t"
      else
        str += "#{el} "
      end
    end

    if string == str[0...-1]
      puts 'не содержит слов состоящих только из согласных'
    else
      puts "\n"
    end
    new_mas.push(str[0...-1]) unless str.empty?
  end
  { total_words: consonant_words, array: new_mas }
  # return {total_words: consonant_words, array: new_mas}
end

# Tests
# mas = ['Зима Тмт Холода', 'Одинокие дома', 'Моря, города, все как будто изо льда', 'Лмблр Птншт',
#        'Но скоро рр без нас снег расстает и тогда...']
#
# new_mas = without_consonant mas
#
# puts "\nMas Before"
# mas.each do |el|
#   puts el
# end
#
# puts "\nMas After"
# new_mas.each do |el|
#   puts el
# end
