# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :user_info_from_session
  before_action :confirm_logged_in

  private

  def user_info_from_session
    @username = cookies[:username]
    @user_id = session[:user_id]
  end

  def logged_in?
    session[:user_id].present?
  end

  def confirm_logged_in
    return false if logged_in?

    flash[:notice] = I18n.t 'ask_login'
    redirect_to login_path
  end
end
