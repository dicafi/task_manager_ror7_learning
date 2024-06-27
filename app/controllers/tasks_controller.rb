# frozen_string_literal: true

# /app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy delete]

  def index
    @tasks = Task.order(:position)
  end

  def show; end

  def new
    @count = Task.count
    @task = Task.new(position: @count + 1)
  end

  def edit; end

  def create
    @task = Task.new(required_params)
    if @task.save
      redirect_to tasks_path
    else
      # The 'new' action is NOT being called here
      # Assign any instance variables needed
      # @count = Task.count + 1
      render('new')
    end
  end

  def update
    if @task.update(required_params)
      redirect_to task_path(@task)
    else
      render('edit')
    end
  end

  def delete; end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def required_params
    params.require(:task).permit(:name, :position, :completed, :description, :category_id)
  end
end
