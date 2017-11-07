class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]
  def show

  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to myaccount_path
    else
      redirect_to signin_path
    end
  end

  def edit
  end

  def update
    current_user.update(user_params)
    flash[:notice] = "Account successfully updated."
    redirect_to account_settings_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone_number)
    end
end
