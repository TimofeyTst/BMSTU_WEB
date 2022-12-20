# frozen_string_literal: true

require_relative 'main'

RSpec.describe Solution do
  it 'Should rescue SystemStackError' do
    2.times do
      ep = 0.00000000000000001
      test_solution = Solution.new ep
      5.times do
        expect(test_solution.count(ep)).to eq(nil)
      end
    end
  end

  it 'Should return correct value' do
    2.times do
      ep = 0.01
      test_solution = Solution.new ep
      5.times do
        expect(test_solution.count(ep).floor(2)).to eq(0.05)
      end
    end
  end
end
