class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if params[:sort] == "n_to_o"
      @user.reviews = @user.reviews.order(created_at: :asc)
    else
    params[:sort] == "n_to_o"
      @user.reviews = @user.reviews.order(created_at: :desc)
    end

  end
end
