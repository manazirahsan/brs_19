class Admin::BooksController < ApplicationController
  def index
    @books = Book.paginate page: params[:page], per_page: 10
  end

  def show
    @book = Book.find params[:id]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t :books_new_success_message
      redirect_to [:admin, @book]
    else
      flash[:danger] = t :books_new_failure_message
      render :new
    end
  end

  def edit
    @book = Book.find params[:id]
  end

  def update
    @book = Book.find params[:id]
    if @book.update_attributes book_params
      flash[:success] = t :books_edit_success_message
      redirect_to [:admin, @book]
    else
      flash[:danger] = t :books_edit_failure_message
      render :edit
    end
  end

  def destroy
    @book = Book.find params[:id]
    if @book.delete
      flash[:success] = t :book_delete_success_message
    else
      flash[:success] = t :book_delete_failure_message
    end
    redirect_to admin_books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :publish_date,
      :num_of_pages, :category_id)
  end
end