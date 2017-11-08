class CheckoutController < ApplicationController
  def new
    @book = Book.find_by(slug: params[:book])
  end

  def create
    book = Book.find_by(slug: params[:book])
    loan = Loan.new(user_id: current_user.id, book_id: book.id)
    if loan.save
      redirect_to myaccount_path
    else
      redirect_to root_path
    end
  end
end
