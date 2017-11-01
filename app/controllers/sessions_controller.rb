class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]

  def new

  end

  def create
    if params[:provider].present?
      user = User.update_or_create(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to myaccount_path
    else
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to myaccount_path
      else
        flash[:failure] = "That login was unsuccessful"
        redirect_to signin_path
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
