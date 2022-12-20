require_relative 'main'

RSpec.describe do
  describe '#Ancestors' do
    let(:circle) { Circle.new(8, 4, 5) }
    let(:point) { Point.new(8, 4) }

    it 'should return true' do
      puts Circle.ancestors.include? Point
      expect(Circle.ancestors.include?(Point)).to eq true
    end

    it 'should be Circle' do
      expect(circle).to be_instance_of(Circle)
    end

    it 'should be Point' do
      expect(point).to be_instance_of(Point)
    end

    it 'Objects should be inherited from Point' do
      expect(circle.class).to be < Point
    end

    it 'Classes should be inherited from Point superclass' do
      expect(Circle.superclass).to be Point
    end

    it 'should be inherited from Point v3' do
      expect(Circle.superclass).to be Point
    end
  end
end
