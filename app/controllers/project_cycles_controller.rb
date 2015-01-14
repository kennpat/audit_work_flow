class ProjectCyclesController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @project_cycle = ProjectCycle.new
    # binding.pry
  end

  def create
    number_of_cycles = params['project_cycle']['cycle_id']
    project = params['project_id']
    number_of_cycles.each do |cycle|
      if cycle != ''
        project_cycle = ProjectCycle.new(project_id: project, cycle_id: cycle)
        project_cycle.save
      end
    end
    redirect_to project_path(project), notice: 'Cycles selected were added successfully'
  end
end
