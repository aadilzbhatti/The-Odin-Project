require 'game'

describe 'The game' do
  it 'should create a code of four colors' do
    test = Game.new
    test.code.length.should == 4
  end

  it 'should check if a guess is correct' do
    test = Game.new
    test.code = 'ABCD'
    test.check_guess('ABCD').should == true
    test.check_guess('ABCF').should == false
  end

  it 'should give the proper response to a guess' do
    test = Game.new
    test.code = 'ABCD'
    test.respond_to_guess('ABCD').should == '####'
    test.respond_to_guess('DCBA').should == '$$$$'
    test.respond_to_guess('ABDC').should == '##$$'
    test.respond_to_guess('ACEF').should == '#$'
    test.respond_to_guess('ACBD').should == '#$$#'
  end
end