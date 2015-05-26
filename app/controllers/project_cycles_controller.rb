class ProjectCyclesController < ApplicationController
  before_action :authenticate_user!

  def new
    @project = Project.find(params[:project_id])
    @project_cycle = ProjectCycle.new
    @cycles = Cycle.all
  end

  def create
    number_of_cycles = params['project_cycle']['cycle_ids']
    project = params['project_id']
    number_of_cycles.each do |cycle|
      if cycle != ''
        project_cycle = ProjectCycle.new(project_id: project, cycle_id: cycle)
        project_cycle.save
      end
    end
    redirect_to project_path(project), notice: 'Cycles selected were added successfully'
  end

  def show
    @project_cycle = ProjectCycle.find_by(id: params[:id])
  end

  def edit
    @project_cycle = ProjectCycle.find(params[:id])
  end

  def destroy
    @project_cycle = ProjectCycle.find(params[:id])
    if @project_cycle.destroy
      redirect_to projects_path, notice: 'Project Cycle has been removed'
    else
      render :edit
    end
  end
end
