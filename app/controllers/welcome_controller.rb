class WelcomeController < ApplicationController

  def index
    @book = Book.all
  end

end
