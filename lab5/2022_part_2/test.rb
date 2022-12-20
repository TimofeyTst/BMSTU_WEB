require_relative 'main'

RSpec.describe Solution do
  describe '#Solution' do
    it 'should return initialize array' do
      expect(Solution.new([1, 2, 3]).arr).to eq([1, 2, 3])
    end
    it 'should return true if contains posled before negative el' do
      uncorrect = [1, 2, 3, -1]
      Random.rand(10).times
      uncorrect.push(Random.rand(-10..9))
      expect(Solution.new(uncorrect).posled?).to eq(true)
    end
    it 'should return false if there is no posled before first neg el' do
      uncorrect = [1, 3, 2, -1]
      Random.rand(10).times
      uncorrect.push(Random.rand(-10..9))
      expect(Solution.new(uncorrect).posled?).to eq(false)
    end
    it 'should return false if first el negative' do
      uncorrect = [-1, 1, 2, 3]
      Random.rand(10).times
      uncorrect.push(Random.rand(-10..9))
      expect(Solution.new(uncorrect).posled?).to eq(false)
    end
    it 'should return false if there is no negative elements' do
      uncorrect = [1, 2, 3]
      Random.rand(10).times
      uncorrect.push(Random.rand(20))
      expect(Solution.new(uncorrect).posled?).to eq(false)
    end
    it 'should contain correct posled' do
      correct = [1, 2, 3]
      uncorrect = [1, 2, 3, -8]
      Random.rand(10).times
      uncorrect.push(Random.rand(20))
      expect(Solution.new(uncorrect).arr_new).to eq(correct)
    end
  end
end
