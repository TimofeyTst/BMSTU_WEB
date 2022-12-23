# frozen_string_literal: true

require_relative 'main'

symbols = "~`!@#$%^&*()_-+=\"№;:?\\/[]{}'.,|"
correct_strings = ['Ты красивая как осень хочу тебя целовать', 'В твоей голове вопросы В моей просто пустота',
                   'Ты же знаешь В любви просто не бывает никогда', 'Потому я молча взял тебя просто поцеловал',
                   'Ты красивая как осень ну а я простой пацан', 'У меня P00 рублей McDonalds тоже ресторан',
                   'Ты же знаешь пацаны мы не берём слова назад', 'Так что наши поцелуи c тобой это навсегда',
                   'Обнимай меня каждый день', 'Засыпай на моих руках', 'Ты же знаешь как важно мне',
                   'Знать у нас всё не просто так', 'Обнимай меня каждый день', 'Засыпай на моих руках',
                   'Ты же знаешь как важно мне', 'Знать у нас всё не просто так']
uncorrect_strings = []
correct_strings.each do |string|
  unc_string = string.split.inject('') do |acc, word|
    if Random.rand(2) == 1
      word << ' '
      Random.rand(2..8).times { word << symbols[Random.rand(symbols.length)] }
    end
    acc << word << ' '
  end
  uncorrect_strings.push(unc_string[0...-1])
end

uncorrect_strings.each do |string|
  puts string
end
puts '+===============================+'
Solution.new(uncorrect_strings).make_correct.each do |el|
  puts el
end
puts correct_strings == Solution.new(uncorrect_strings).make_correct
