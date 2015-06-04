require 'control'

describe 'The controller' do
  it 'should decrement guesses' do
    test = Control.new
    test.decrement_guesses
    test.guesses.should == 11
  end
end