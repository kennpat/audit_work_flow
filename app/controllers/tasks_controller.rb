class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.new
    @project_cycle = ProjectCycle.find(params[:project_cycle_id])
  end

  def create
    @task = Task.new(task_params)
    @project_cycle = ProjectCycle.find(params[:project_cycle_id])
    if @task.save
      redirect_to project_cycle_path(@task.project_cycle_id), notice: 'Task added successfully'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to project_cycle_path(@task.project_cycle_id), notice: 'Task updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to project_cycle_path(@task.project_cycle_id),
        notice: 'Project has been successfully deleted'
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :task_description, :status_id,
      :priority, :project_cycle_id)
  end
end
