# frozen_string_literal: true

require_relative 'main'

RSpec.describe Solution do
  it 'should return correct results' do
    results = [0.041, 0.049, 0.052, 0.053, 0.054]
    ep = 0.1
    test_solution = Solution.new

    3.times do
      test_solution.ep = ep
      test_solution.each_with_index do |el, index|
        expect(el.floor(3)).to eq results[index]
      end
      ep /= 10
    end
  end
end
