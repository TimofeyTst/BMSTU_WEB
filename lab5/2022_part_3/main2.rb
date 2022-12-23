# frozen_string_literal: true

# Дана последовательность строк. Каждая строка состоит из слов, разделенных
# пробелами. Написать программу, обеспечивающую ввод строк и их корректировку.

# Удалить слова содержащие что угодно кроме букв или цифр.
# Если слово состоит из букв и цифр и начинается с цифры, заменить эту цифру символом «_» подчеркивание.
# Вести подсчет количества корректировок.
# Вывести на печать исходные и скорректированные последовательности строк.

# Автоматический тест программы обязательно должен генерировать
# случайные строки в соответствии с правилами, перечисленными в задании.
class Solution2
  attr_accessor :counter

  def initialize(strings)
    @strings = strings
    @reg_exp = /^[ёЁа-яА-Я0-9a-zA-Z]*$/
    @counter = 0
  end

  def make_correct_with_count(strings = @strings)
    strings.map! do |string|
      selected = string.split.select do |el|
        @counter += 1 unless el.match(@reg_exp)
        el.match(@reg_exp)
      end
      selected.map! do |word|
        @counter += 1 if word.match(/^\d/)
        word.sub(/^\d/, '_')
      end
      selected.join(' ')
    end

    strings.reject(&:empty?)
  end

  def make_correct(strings = @strings)
    strings.map! do |string|
      string.split.select { |el| el.match(@reg_exp) }.map! { |word| word.sub(/^\d/, '_') }.join(' ')
    end
    strings.reject(&:empty?)
  end
end

test_str = ['Ты красивая ?менянедолжнобыть как осень хочу тебя целовать',
            'В твоей 9УдалиЦифру голове вопросы В моей просто пустота', '^sadas', '&dk', '*asda']

solution = Solution2.new(test_str)
p solution.make_correct

# solution.make_correct.each do |el|
#   puts "#{el}"
# end
p solution.counter
