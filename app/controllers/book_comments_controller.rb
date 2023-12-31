class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    if comment.save
      redirect_to book_path(@book)
    else
      @book = Book.find(params[:book_id])
      @user = @book.user
      @book_comment = BookComment.new
      render 'books/show'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.find_by(book_id: @book.id)
    comment.destroy
    redirect_to book_path(@book.id)
  end
  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
