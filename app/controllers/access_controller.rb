# frozen_string_literal: true

class AccessController < ApplicationController
  # display menu
  def menu
    @username = cookies[:username]
    @user_id = session[:user_id]
  end

  # display login form
  def new
  end

  # processs login form
  def create
    # do login process here
    cookies[:username] = params[:username]
    session[:user_id] = 1234
    flash[:notice] = I18n.t 'login_success'
    redirect_to(menu_path)
  end

  # logout user
  def destroy
    # do logout process here
    redirect_to(login_path)
  end
end
