class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project created successfully'
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @assigned_users = AssignedUser.where(project_id: params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project.id), notice: 'Project updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to projects_path, notice: 'Project has been successfully deleted'
    else
      render :show
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :status, :project_type, :stage)
  end

end
