class UsersController < ApplicationController
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
      redirect_to sign_in_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
