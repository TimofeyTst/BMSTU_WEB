# frozen_string_literal: true

# Дана последовательность строк. Каждая строка состоит из слов, разделенных
# пробелами. Написать программу, обеспечивающую ввод строк и их корректировку.

# Удалить слова содержащие что угодно кроме букв или цифр.
# Если слово состоит из букв и цифр и начинается с цифры, заменить эту цифру символом «_» подчеркивание.
# Вести подсчет количества корректировок.
# Вывести на печать исходные и скорректированные последовательности строк.

# Автоматический тест программы обязательно должен генерировать
# случайные строки в соответствии с правилами, перечисленными в задании.
class Solution
  attr_accessor :counter, :correct_strings

  def initialize(strings)
    @strings = strings
    @correct_strings = strings
    @reg_exp = /^[ёЁа-яА-Я0-9a-zA-Z]*$/
    @counter = 0
  end

  def make_correct(strings = @strings)
    @correct_strings = []
    strings.each do |string|
      new_str = ''
      string.split.each do |str|
        if str.match(@reg_exp)
          @counter += 1 if str.match(/^\d/)
          new_str << str.sub(/^\d/, '_') << ' '
        end
      end
      @correct_strings.push(new_str[0...-1]) unless new_str.empty?
    end
    @correct_strings
  end
end

# test_str = ['Ты красивая ?дичь как осень , хочу &Удалить тебя целовать', 'В *Кринж* твоей голове {FK} вопросы , В (Kb(i моей просто пустота',
#             'Ты же знаешь , В любви просто не бывает никогда', 'Потому я молча test< взял тебя просто поцеловал',
#             'Ты красивая , как осень , ну а я простой пацан', 'У меня 500 рублей , McDonalds – тоже ресторан',
#             'Ты же знаешь - пацаны , мы не берём слова назад', 'Так что наши поцелуи c тобой – это навсегда',
#             'Обнимай меня каждый день', 'Засыпай на моих руках', 'Ты же знаешь , как важно мне',
#             'Знать , у нас всё не просто так', 'Обнимай меня каждый день', 'Засыпай на моих руках',
#             'Ты же знаешь, как важно мне', 'Знать , у нас всё не просто так']
# test_str = ['Ты красивая ?менянедолжнобыть как осень хочу тебя целовать', 'В твоей голове вопросы В моей просто пустота']

# solution = Solution.new(test_str)
# solution.make_correct.each do |el|
#   puts "#{el}"
# end
# p solution.counter
