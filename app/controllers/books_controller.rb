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
    if params[:sort] == 'avg rating desc'
      @books = Book.order(average_rating: :desc)
    elsif params[:sort] == 'avg rating asc'
      @books = Book.order(average_rating: :asc)
    elsif params[:sort] == 'pages desc'
      @books = Book.order(pages: :desc)
    elsif params[:sort] == 'pages asc'
      @books = Book.order(pages: :asc)
    elsif params[:sort] == 'reviews desc'
      # @books = Book.sort_by_most_reviews
      @books = Book.select('books.*, count(reviews.id) as count_reviews').left_outer_joins(:reviews).group(:id).order('count_reviews desc').order(:id)
    elsif params[:sort] == 'reviews asc'
      @books = Book.select('books.*, count(reviews.id) as count_reviews').left_outer_joins(:reviews).group(:id).order('count_reviews asc')
    else
      @books = Book.all
    end
    @top_users = User.most_reviews
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    binding.pry
    redirect_to books_path
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
