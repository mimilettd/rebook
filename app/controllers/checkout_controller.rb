class CheckoutController < ApplicationController
  def new
    @book = Book.find_by(slug: params[:book])
  end

  def create
    if current_user.street_address.nil?
      flash[:notice] = "Please update your address to checkout."
      redirect_to account_settings_path
    else
      book = Book.find_by(slug: params[:book])
      loan = Loan.new(user_id: current_user.id, book_id: book.id)
      if loan.save
        redirect_to myaccount_path
      else
        redirect_to root_path
      end
    end
  end
end
