class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]
  def show
    @user = current_user.decorate
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/charges/new?subscription=yes"
    else
      redirect_to signin_path
    end
  end

  def edit
    if params["update"] == "address"
      render :template => 'users/address'
    else
      render :template => 'users/edit'
    end
  end

  def update
    current_user.update(user_params)
    flash[:notice] = "Account successfully updated."
    redirect_to account_settings_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone_number, :street_address, :city, :state, :zip)
    end
end
