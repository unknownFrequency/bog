require 'test_helper'

class BookTest < ActiveSupport::TestCase

  def setup
    @book = Book.new
  end

  test "new books have no id" do
    assert_nil @book.id
  end

  test "author remembers its value" do
    @book.author = 'Tolkien'
    assert_equal 'Tolkien', @book.author
  end

  test "saving a book" do
    @book.title = 'The Two Towers'
    @book.author = 'Tolkien'
    @book.save

    two_towers = Book.find_by(title: 'The Two Towers', author: 'Tolkien')
    assert_not_nil two_towers.id
  end

  test "find an existing book" do
    book = Book.find_by(title: "Ender's Game")
    assert_not_nil book.id
    assert_equal "Ender's Game", book.title
  end

end
