require 'spec_helper'

describe Linear::Regression do
  before do
    @lr = Linear::Regression.new(x: [1,2,3], y: [4,6,8])
  end
  
  it 'X values should be array' do
    @lr.x.is_a? Array
  end
  
  it 'Y values should be array' do
    @lr.y.is_a? Array
  end

  it 'X and Y should be same size' do
    @lr.x.size == @lr.y.size
  end

  it '#make should be return float value' do
    @lr.make(30).is_a? Float
  end
  
end
