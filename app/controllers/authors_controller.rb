class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
    @co_authors = 
    binding.pry
  end

end
