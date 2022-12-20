require_relative 'main'

RSpec.describe Solution do
  describe '#main' do
    it 'should return not changed strings' do
      test_strings = ['Ты красивая как осень хочу тебя целовать', 'В твоей голове вопросы В моей просто пустота']
      correct_strings = Solution.new(test_strings).make_correct
      expect(correct_strings).to eq(test_strings)
    end

    it 'should return with deleting strings contains only spec symbols' do
      test_strings = ['Ты красивая как осень хочу тебя целовать', 'В твоей голове вопросы В моей просто пустота']
      correct_strings = Solution.new(test_strings + ['&hasd', '*dasf', 'asd)']).make_correct
      expect(correct_strings).to eq(test_strings)
    end

    it 'should returns true for auto generating strings' do
      # ind = 0
      5000.times do
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

        expect(Solution.new(uncorrect_strings).make_correct).to eq(correct_strings)
        # ind += 1
        # if (ind == 5)
        #     expect(Solution.new(uncorrect_strings).make_correct).to eq(correct_strings + ["test"])
        # end
      end
    end
  end

end
