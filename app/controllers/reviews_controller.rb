class ReviewsController < ApplicationController

  before_action :set_book

  def index
    @reviews = @book.reviews.order('created_at desc')
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

end
