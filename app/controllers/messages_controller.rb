class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_book

  respond_to :html

  def index
    @messages = Message.all
    respond_with(@messages)
  end

  def show
    @message = @book.messages.find(params[:id])
    respond_with @book, @message 
  end

  def new
    @message = @book.messages.new
  end

  def create
    @message = @message.new(message_params)
    respond_with @book, @review  do |format|
      if message.save
        flash[:notice] = 'Beskeden er oprettet!' unless request.xhr?
      else
        format.html { render 'new', status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    def message_params
      params.require(:message).permit(:content, :user_id, :reciever_id, :book_id)
    end
end
