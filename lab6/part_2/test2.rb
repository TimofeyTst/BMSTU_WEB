# frozen_string_literal: true

require_relative 'main2'

RSpec.describe Solution2 do
  describe '#show' do
    it 'should return correct results' do
      results = [0.041, 0.198, 0.418, 0.861, 1.639]
      ep = 0.1
      results.each do |result|
        ep /= 10
        expect(Solution2.show(ep).floor(3)).to eq result
      end
    end

    it 'should return nil if zero' do
      expect(Solution2.show(1)).to be_nil
    end
  end
end
