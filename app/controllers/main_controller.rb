# frozen_string_literal: true

# /app/controllers/main_controller.rb
class MainController < ApplicationController
  def index
    # render 'index'
    render 'access/menu'
  end

  def about
    # render 'about'
    @created_by = 'dicafis'
    @id = params['id']
    @page = params[:page]
  end

  def hello
    redirect_to action: 'index'
  end
end
