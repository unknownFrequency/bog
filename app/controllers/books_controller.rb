class BooksController < ApplicationController

  respond_to :html, :xml, :json

  before_action :set_book,
                only: [:show, :edit, :update, :destroy]

  before_action :set_specials_flash,
                only: [:index, :bargains]

  def index
    @books = list_books
    if params[:search]
      @books = Book.search(params[:search]).order("created_at DESC")
    end

    respond_with @books
  end

  def bargains
    @books = list_books.bargains
    respond_with @books
  end

  def show
    respond_with @book
  end

  def new
    if user_signed_in?
      @book = Book.new
    else
      redirect_to new_user_registration_path
    end
  end

  def create
    @book = Book.new(book_params)
    @user_id = current_user.id
    flash[:notice] = "#{@book.title} blev tilføjet med bruger_id #{@book.user_id}!" if @book.save
    respond_with @book
  end

  def edit
  end

  def update
    flash[:notice] = "#{@book.title} blev opdateret!" if @book.update(book_params)
    respond_with @book
  end

  def destroy
    @book.destroy
    redirect_to books_url, alert: "#{@book.title} blev slettet!"
  end

  private

  def set_specials_flash
    flash[:notice] = "!Tilføj felt Paperback/Hardcover! Hos Kundskabens Træ finder du bøger til de søgende og dem som elsker viden. "
  end

  def list_books
    Book.includes(:reviews).order(:title).page params[:page]
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def author_search
    @author_books = Book.where(author: params[:author]).order(created_at: :desc)
  end

  def book_params
    params.require(:book).permit(:user_id, :title, :abstract, :author, :pages, 
                                 :price, :genre, :cover, book_photos_attributes: [:id, :photo, :_destroy] )
  end
end
