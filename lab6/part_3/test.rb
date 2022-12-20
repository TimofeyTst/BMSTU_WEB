# frozen_string_literal: true

require_relative 'main'

RSpec.describe Solution do
  it 'Should return [-1, 0.24] for (x - 1)/(x + 2) like lambda' do
    y = Y1.new 0, 2
    results = [-1, 0.24]
    y.my_minmax { |x| ((x - 1) / (x + 2)) }.each_with_index do |el, index|
      expect(el.floor(2)).to eq results[index]
    end
  end

  it 'Should return [-0.99, -0.48] for sin(x / 2 - 1) like proc' do
    y = Y2.new(-1, 1)

    results = [-0.9971288334080497, -0.4838074403239595]
    y.my_minmax { |x| Math.sin(x / 2 - 1) }.each_with_index do |el, index|
      expect(el).to eq results[index]
    end
  end
end
