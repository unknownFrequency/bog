class BooksController < ApplicationController

  before_action :set_book,
                only: [ :show, :edit, :update, :destroy ]

  def index
    @available_at = Time.now
    @books = Book.all

    flash[:notice] = "Today's special is 30% off all Sci-Fi books!"
    # flash[:alert] = "We'll be down for maintenance Sunday. Sorry."
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "#{@book.title} was created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "#{@book.title} was updated!"
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, alert: "#{@book.title} was deleted!"
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :pages, :price, :image_file_name)
  end

  def set_book
    @book = Book.find(params[:id])
  end

end
