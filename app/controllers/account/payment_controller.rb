class Account::PaymentController < ApplicationController
  def show
    @customer = Subscription.fetch_customer(current_user)
  end
end
