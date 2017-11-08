class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user,
                :categories

  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def categories
    @categories = Category.all.order(:name)
  end
end
