# frozen_string_literal: true

# /app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  def index
    @tasks = ['Task 1', 'Task 2', 'Task 3', 'Task 4']
    @page = params[:page].to_i
  end

  def new; end

  def edit; end
end
