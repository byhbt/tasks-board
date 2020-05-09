class TasksController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy, :change]
  before_action :authenticate_user!

  def index
    @todo = current_user.tasks.where(state: 'to_do')
    @doing = current_user.tasks.where(state: 'doing')
    @done = current_user.tasks.where(state: 'done')
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

  def change
    @task.update_attributes(state: params[:state])
    flash[:notice] = "Task is changed successfully."
    redirect_to tasks_path
  end

  private

  def set_resource
    @task = Task.find(params[:id])
  end

  def tasks_params
    allow_params = %i[content state]
    params.require(:task).permit(allow_params)
  end
end
