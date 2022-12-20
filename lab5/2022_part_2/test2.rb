require_relative 'main2'

RSpec.describe Solution do
  describe '#Solution' do
    it 'should return true' do
      expect(Solution.posled?([1, 2, 3])).to eq(false)
    end

    it 'should return true if contains posled before negative el' do
      uncorrect = [1, 2, 3, -1]
      Random.rand(10).times { uncorrect.push(Random.rand(-10..9)) }
      expect(Solution.posled?(uncorrect)).to eq(true)
    end

    it 'should return false if there is no posled before first neg el' do
      uncorrect = [1, 3, 2, -1]
      Random.rand(10).times { uncorrect.push(Random.rand(-10..9)) }
      expect(Solution.posled?(uncorrect)).to eq(false)
    end

    it 'should return false if first el negative' do
      uncorrect = [-1, 1, 2, 3]
      Random.rand(10).times { uncorrect.push(Random.rand(-10..9)) }
      expect(Solution.posled?(uncorrect)).to eq(false)
    end

    it 'should return false if there is no negative elements' do
      uncorrect = [1, 2, 3]
      Random.rand(10).times { uncorrect.push(Random.rand(-10..9)) }
      expect(Solution.posled?(uncorrect)).to eq(false)
    end
  end
end
