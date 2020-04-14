class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(tasks_params)
    if @task.save()
      flash[:notice] = 'The task was successfully created!'
      redirect_to task_path(@task)
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    @task = Task.find(params[:id])
    if @task.update(tasks_params)
      flash[:notice] = "Task is updated successfully"
      redirect_to task_path(@task)
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "Task is deleted successfully!"

    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:content)
  end
end
