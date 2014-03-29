class ReviewsController < ApplicationController

  before_action :set_book

  def index
    @reviews = @book.reviews.order('created_at desc')
  end

  def new
    @review = @book.reviews.new
  end

  def create
    @review = @book.reviews.new(review_params)
    if @review.save
      message = 'Thanks for your review!'
      respond_to do |format|
        format.html { redirect_to book_reviews_path(@book), notice: message }
        format.js do
          flash.now[:notice] = message
          render status: :created
        end
      end
    else
      render :new, status: :unprocessable_entity
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
