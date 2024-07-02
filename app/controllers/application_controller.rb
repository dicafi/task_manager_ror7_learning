# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def user_info_from_session
    @username = cookies[:username]
    @user_id = session[:user_id]
  end

  def logged_in?
    session[:user_id].present?
  end
end
