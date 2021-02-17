class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    book = @new_book
    if book.save
     flash[:notice] = "Book was successfully created."
    redirect_to book_path(book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.find(current_user.id)
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
   @book = Book.find(params[:id])
   if @book.user == current_user
    render "edit"
   else
    redirect_to books_path
   end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "Book was successfully updated."
       redirect_to book_path
    else 
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
