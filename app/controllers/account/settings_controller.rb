class Account::SettingsController < ApplicationController
  def show
    @user = current_user.decorate
  end
end
