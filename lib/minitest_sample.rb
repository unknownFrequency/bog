require 'minitest/autorun'

class Book
  attr_accessor :author
end

describe Book do
  before do
    @book = Book.new
  end

  describe 'author' do
    it 'stores a value' do
      @book.author = 'Tolkien'
      @book.author.must_equal 'Tolkien'
    end
  end
end
