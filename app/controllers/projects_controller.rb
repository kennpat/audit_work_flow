class ProjectsController < ApplicationController
  def index

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

  private

  def project_params
    params.require(:project).permit(:project_name, :status, :project_type, :stage)
  end

end
