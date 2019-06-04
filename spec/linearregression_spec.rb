require 'spec_helper'

describe Linear::Regression, '#projection' do
  let(:data) {
    { 
      1 => 1000,
      2 => 2000,
      3 => 3000,
      4 => 4000,
      5 => 5000,
      6 => 6000,
      7 => 7000,
      8 => 8000,
    }
  }

  subject { described_class.new(data) }

  context 'when is a valid value' do
    it 'should return a new projection' do
      expect(subject.projection(9)).to eq(BigDecimal(9_000))
      expect(subject.projection(10)).to eq(BigDecimal(10_000))
      expect(subject.projection(11)).to eq(BigDecimal(11_000))
    end
  end  
  
end
