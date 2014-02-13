class BooksController < ApplicationController

  def index
    @available_at = Time.now
    @books = Book.all
  end

end
