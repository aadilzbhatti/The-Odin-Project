require 'spec_helper'

describe Book do
	before :each do
		@book = Book.new 'Title', 'Author', :category
	end

	describe '#new' do
		it 'returns a new book object' do
			@book.should be_an_instance_of Book
		end

		it 'takes three parameters and returns a new book object' do
			lambda { Book.new('Title', 'Author') }.should raise_exception(ArgumentError)
		end
	end

	describe '#title' do
		it 'returns correct title' do
			@book.title.should == 'Title'
		end
	end

	describe '#author' do
		it 'returns correct author' do
			@book.author.should == 'Author'
		end
	end

	describe '#category' do
		it 'returns correct category' do
			@book.category.should == :category
		end
	end
end