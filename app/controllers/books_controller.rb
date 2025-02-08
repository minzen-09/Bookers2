class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.all
    @booknew = Book.new(book_params)
    @booknew.user_id = current_user.id
    if @booknew.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@booknew)
    else
      # flash[:alert] = "You have failed to create the book.Please check your input."
      render :index
    end

  end
  
  def index
    @book = Book.all
    @booknew = Book.new
    @user = current_user
  end 

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @booknew = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  
    # ユーザーが自分の本だけを編集できるようにする
    unless @book.user_id == current_user.id
      redirect_to books_path, alert: "You are not authorized to edit this book."
    end
  end
  

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      flash.now[:alert] = "error Book was not created successfully"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

    # 投稿データのストロングパラメータ
    private

    def book_params
      params.require(:book).permit(:title, :image, :body)
    end
end
