class SessionsController < ApplicationController
  def new

  end

  def create
    if params[:provider].present?
      user = User.update_or_create(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to myaccount_path
    else
      user = User.find_by(email: params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to myaccount_path
      else
        flash[:failure] = "That login was unsuccessful"
        redirect_to signin_path
      end
    end
  end
end
