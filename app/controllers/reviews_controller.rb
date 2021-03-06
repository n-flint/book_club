class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(review_params)
    if @review.save
      @book.update(average_rating: @book.average_score)
      redirect_to book_path(params[:book_id])
    else
      @book = Book.find(params[:book_id])
      render :new
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to user_path(review.user_id)
  end

  private
  def review_params
    parameters = params.require(:review).permit(:title, :user_id, :rating, :review)
    params[:review][:user] = params[:review][:user].titleize
    @user = User.find_or_create_by(name: params[:review][:user])
    parameters[:user] = @user
    parameters
  end
end
