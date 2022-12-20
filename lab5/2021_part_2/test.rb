require 'minitest/autorun'
require_relative 'main'

class MyTest < Minitest::Test
  def setup
    puts "\t=======Setup BEGIN======="

    @text = ['Ты красивая, как осень, хочу тебя целовать', 'Втвоей голове вопросы, Вмоей просто пустота',
             'Ты же знаешь, Влюбви просто не бывает никогда', 'Потому я молча взял тебя просто поцеловал',
             'Ты красивая, как осень, ну а я простой пацан', 'У меня 500 рублей, McDonalds –тоже ресторан',
             'Ты же знаешь -пацаны, мы не берём слова назад', 'Так что наши поцелуи Стобой –это навсегда',
             'Обнимай меня каждый день', 'Засыпай на моих руках', 'Ты же знаешь, как важно мне',
             'Знать, у нас всё не просто так', 'Обнимай меня каждый день', 'Засыпай на моих руках',
             'Ты же знаешь, как важно мне', 'Знать, у нас всё не просто так']
    @consonant_words = []
    54.times do
      str = ''
      Random.rand(1..7).times { str += Consonant[Random.rand(40)] }
      @consonant_words.push(str)
    end
    
    generate_arrays

    puts "\n-------Correct mas-------"
    @correct_mas.each do |el|
      puts el
    end

    puts "\n-------UNCorrect mas-------"
    @uncorrect_mas.each do |el|
      puts el
    end

    puts "Всего согласных слов: #{@total_words}"
    puts "\n\t=======Setup END======="
  end

  def generate_arrays
    @correct_mas = []
    @uncorrect_mas = []
    @total_words = 0
    ind = 0
    (Random.rand(16)+1).times do
      case Random.rand(3)
        when 0
          @uncorrect_mas.push(@text[ind])
          @correct_mas.push(@text[ind])
          ind += 1
        when 1 # Add random count consonants words in random place in uncorrect mas
          @correct_mas.push(@text[ind])
          @uncorrect_mas.push((@text[ind].split.inject("") do |acc, string|
            if Random.rand(2) == 1
              acc << @consonant_words[Random.rand(@consonant_words.length)] << ' '
              @total_words+=1 
            end
            acc << string << ' '
          end)[0...-1])
          ind += 1
        when 2 # Simple add in correct mas string with consonant word
          @uncorrect_mas.push(@consonant_words[Random.rand(@consonant_words.length)])
          @total_words += 1
      end
    end
  end

  def test_50_times
    index = 0
    50000.times do
      puts "\n\t=======TEST ##{index+=1} BEGIN======="
      result = without_consonant @uncorrect_mas
      puts "\n\t-------TEST ##{index+=1} OUTPUT-------"
      flag = (@correct_mas == result[:array])
      puts flag
      puts "Total was: #{@total_words}\tTotal after func: #{result[:total_words]}"
      assert result[:array] == @correct_mas
      assert result[:total_words] == @total_words
      generate_arrays
    end  
  end
end
