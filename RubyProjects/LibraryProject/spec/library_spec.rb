require 'spec_helper'

describe Library do
	before :all do
		lib_arr = [
			Book.new('Javascript: The Good Parts', 'Douglas Crockford', :development),
			Book.new('Designing With Web Standards', 'Jeffrey Zeldman', :design),
			Book.new('Don\'t Make Me Think', 'Steven Krug', :usability),
			Book.new('Javascript Patterns', 'Stoyan Stefanov', :development),
			Book.new('Responsive Web Design', 'Ethan Marcotte', :design)
		]
		File.open('books.yml', 'w') {|f| f.write YAML::dump lib_arr}
	end

	before :each do
		@lib = Library.new 'books.yml'
	end

	describe '#new' do
		context 'with no parameters' do
			it 'has no books' do
				lib = Library.new
				lib.books.length.should == 0
			end
		end

		context 'with a yaml file name parameter' do
			it 'has five books' do
				@lib.books.length.should == 5
			end 
		end
	end

	it 'returns all the books in a given category' do
		@lib.get_books_in_category(:development).length.should == 2
	end

	it 'accepts new books' do
		@lib.add_book(Book.new('Designing for the Web', 'Mark Boulton', :design))
		@lib.get_book('Designing for the Web').should be_an_instance_of Book
	end

	it 'saves a library' do
		books = @lib.books.map{|book| book.title}
		@lib.save('our_new_library.yml')
		lib2 = Library.new('books.yml')
		books2 = lib2.books.map {|book| book.title}
		books.should == books2
	end
end