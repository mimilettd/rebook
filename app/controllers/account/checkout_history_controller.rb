class Account::CheckoutHistoryController < ApplicationController
  def index
    @loans = current_user.loans.decorate
  end
end
