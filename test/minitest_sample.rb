require 'minitest/autorun'

class Book
  attr_accessor :author
end

class TestBook < MiniTest::Unit::TestCase
  def setup
    @book = Book.new
  end

  def test_author_remembers_value
    @book.author = 'Tolkien'
    assert_equal 'Tolkien', @book.author
  end
end
