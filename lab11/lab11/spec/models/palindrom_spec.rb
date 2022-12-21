require 'rails_helper'

RSpec.describe Palindrom, type: :model do
  describe 'If adding with similar params' do
    before do
      Palindrom.destroy_all
      Palindrom.create!(upper: 17)
    end
    it 'should return error if value isn`t unique' do
      expect { Palindrom.create!(upper: 17) }.to raise_error(ActiveRecord::RecordNotUnique)
    end
    context 'should return correct result' do
      it 'when upper 17' do
        expect(Palindrom.create!(upper: 12).result).to eq('[1,2,3,11]')
      end
      it 'when upper 35' do
        expect(Palindrom.create!(upper: 35).result).to eq('[1,2,3,11,22]')
      end
    end
  end
end
