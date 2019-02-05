class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   review = Review.find(params[:review])
  #   review.destroy
  #   require "pry"
  #   binding.pry
  #   redirect_to user_path(@user.id)
  # end
end
