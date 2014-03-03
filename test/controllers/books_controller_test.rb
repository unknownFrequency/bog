require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  fixtures :books

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)

    assert_select "h1", 1
    assert_select "a", Book.count
  end

  test "should get show" do
    hobbit_book = books(:hobbit)
    get :show, id: hobbit_book.id
    assert_response :success

    assert_select "header h2", "The Hobbit"

    assert_select "p" do |elements|
      html = elements.join(" ")
      assert html.include?(hobbit_book.author), "should contain #{hobbit_book.author}"
      assert html.include?(hobbit_book.pages.to_s), "should contain #{hobbit_book.pages}"
      assert html.include?(hobbit_book.price.to_s), "should contain #{hobbit_book.price}"
    end

    assert_select "a#all_books_link", "All Books"
  end

end
