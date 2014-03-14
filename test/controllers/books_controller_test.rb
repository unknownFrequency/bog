require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  fixtures :books

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)

    assert_select 'h1', 1
    assert_select 'h1', "#{Book.count} books"
    assert_select 'ul a', Book.count
  end

  test 'should get show' do
    book = books(:hobbit)
    get :show, id: book.id
    assert_response :success

    assert_select 'header h2', 'The Hobbit'

    assert_select 'p' do |elements|
      html = elements.join(' ')
      assert html.include?(book.author), "should contain #{book.author}"
      assert html.include?(book.pages.to_s), "should contain #{book.pages}"
      assert html.include?(book.price.to_s), "should contain #{book.price}"
    end

    assert_select 'a#all_books_link', 'All Books'
  end
end
