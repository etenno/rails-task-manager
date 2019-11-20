class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    inputs = {
      title: params[:task][:title],
      details: params[:task][:details],
      completed: params[:task][:completed]
    }

    @task = Task.new(inputs)
    @task.save
    redirect_to '/tasks'
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    inputs = {
      title: params[:task][:title],
      details: params[:task][:details],
      completed: params[:task][:completed]
    }

    @task.update(inputs)
    redirect_to '/tasks'
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
end
