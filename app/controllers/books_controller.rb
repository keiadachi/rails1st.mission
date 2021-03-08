class BooksController < ApplicationController

  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end


  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:book] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render action: :index
    end
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:book] = "Book was successfully update."
    else
      render action: :edit
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:book] = "Book was successfully destroyed."
  end



  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
