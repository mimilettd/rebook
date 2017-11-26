class Account::ReturnController < ApplicationController
  def show
    label_url = ShippingLabel.generate(current_user)
    redirect_to label_url
  end
end
