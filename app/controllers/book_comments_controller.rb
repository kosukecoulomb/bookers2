class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
      render :book_comments
    else
      render 'books/show'
    end
  end
  
  def destroy
    book = Book.find(params[:book_id])
    BookComment.find(params[:id]).destroy
    render :book_comments
  end
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
