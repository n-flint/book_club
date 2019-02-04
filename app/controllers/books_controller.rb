class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save && params[:book][:authors] != ''
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
    @navbar = [root_path, new_book_path]
    @books = Book.all
    @top_users = User.most_reviews
    binding.pry
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  def book_params
    default = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6'
    if params[:book][:cover] == '' || params[:book][:cover] == nil
      params[:book][:cover] = default
    else
      params[:book][:cover]
    end
    params.require(:book).permit(:title, :pages, :published, :cover)
  end
end
