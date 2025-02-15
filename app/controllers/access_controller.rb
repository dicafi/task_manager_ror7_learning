# frozen_string_literal: true

class AccessController < ApplicationController
  layout 'application'

  skip_before_action :confirm_logged_in, only: %i[new create]

  # display menu
  def menu; end

  # display login form
  def new
    redirect_to menu_path if logged_in?
  end

  # processs login form
  def create
    logger.info("*** Login User #{params[:username]}")
    # do login process here
    cookies[:username] = params[:username]
    session[:user_id] = 1234
    flash[:notice] = I18n.t 'login_success'
    redirect_to(menu_path)
  end

  # logout user
  def destroy
    logger.info("*** Logged out User #{cookies[:username]}")
    # do logout process here
    session[:user_id] = nil
    cookies[:username] = nil
    flash[:notice] = I18n.t 'logout_success'
    redirect_to(login_path)
  end
end
