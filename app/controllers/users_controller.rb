class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = Book.find(:all, :conditions => {:user_id => params['id']}) 
  end



  

end
