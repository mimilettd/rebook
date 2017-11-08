class CartController < ApplicationController
  def show
    @book = Book.find_by(slug: params[:book])
  end
end
