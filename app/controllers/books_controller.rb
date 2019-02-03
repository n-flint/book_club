class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      authors = params[:book][:authors].split(',')
      authors = authors.each do |name|
        @book.authors.find_or_create_by(name: name.strip.titleize)
      end
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :pages, :published)
  end
end
