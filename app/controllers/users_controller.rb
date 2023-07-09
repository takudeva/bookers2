class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    @user = User.find(params[:id])
    redirect_to user_path(@user)
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
