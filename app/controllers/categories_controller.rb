# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit update destroy delete]

  def index
    @categories = Category.order(:name)
  end

  def show; end

  def new
    @count = Category.count
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(required_params)
    if @category.save
      redirect_to categories_path
    else
      # The 'new' action is NOT being called here
      # Assign any instance variables needed
      render('new')
    end
  end

  def update
    if @category.update(required_params)
      redirect_to category_path(@category)
    else
      render('edit')
    end
  end

  def delete; end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def required_params
    params.require(:category).permit(:name)
  end
end
