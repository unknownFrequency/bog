require 'test_helper'

class BookTest < ActiveSupport::TestCase
  fixtures :books

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
    @book.abstract = 'Frodo returns in the second book in the LOTR series.'
    @book.author = 'Tolkien'
    @book.pages = 300
    @book.price = 9.99
    @book.genre = 'Fantasy'
    @book.published_on = Time.local(1937, 9, 21)
    @book.save!

    two_towers = Book.find_by(title: 'The Two Towers')
    assert_not_nil two_towers.id
  end

  test "find an existing book" do
    book = Book.find_by(title: "Ender's Game")
    assert_not_nil book.id
    assert_equal "Ender's Game", book.title
  end

  test "update an existing book" do
    book = books(:hobbit)
    book.author = 'J.R.R. Tolkien'
    book.save!

    updated = Book.find(book.id)
    assert_equal 'J.R.R. Tolkien', updated.author
  end

end
