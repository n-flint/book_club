class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      create_relation
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
  def create_relation
    Author.all.pluck(:id).each do |id|
      BookAuthor.create(book_id: @book.id, author_id: id)
    end
  end
  
  def book_params
    authors = params[:book][:author].split(',')
    authors = authors.each do |name| Author.find_or_create_by(name: name.strip)
    end
    params.require(:book).permit(:title, :author, :pages, :published)
  end
end
