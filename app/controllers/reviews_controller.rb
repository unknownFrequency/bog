class ReviewsController < ApplicationController

  respond_to :html, :xml, :json

  before_action :set_book

  def index
    @reviews = @book.reviews.order('created_at desc')
    respond_with @reviews
  end

  def show
    @review = @book.reviews.find(params[:id])
    respond_with @book, @review
  end

  def new
    @review = @book.reviews.new
  end

  def create
    @review = @book.reviews.new(review_params)
    respond_with @book, @review  do |format|
      if @review.save
        flash[:notice] = 'Thanks for your review!' unless request.xhr?
      else
        format.html { render 'new', status: :unprocessable_entity }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :stars, :summary, :comment)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

end
