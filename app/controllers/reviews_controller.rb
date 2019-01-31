class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @user = User.find_by(name: params[:review_user])
    @user = User.create(name: params[:review_user]) unless @user
    @review = @user.reviews.new(review_params)

    if @review.save
      redirect_to book_path(params[:book_id])
    else
      @book = Book.find(params[:book_id])
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :rating, :review)
  end
end
