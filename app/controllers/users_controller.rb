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
    @books = @user.books
    @booknew = Book.new
   end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      # flash.now[:alert] = 'You have failed to update the user.Please check your input.'
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :profile_image, :introduction)
  end

end
