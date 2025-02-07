class UsersController < ApplicationController
  
  def index
    @book = Book.all
    @booknew = Book.new
    @user = current_user
    @users = User.all
  end 

  def show
    @user = User.find(params[:id])
    @book = @user.books
    @booknew = Book.new
   end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :profile_image, :introduction)
  end

end
