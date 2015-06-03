require 'game'
require 'rspec'

describe 'The game' do
  it 'should create a code of six colors' do
    test = Game.new
    test.code.length.should == 6
  end
end