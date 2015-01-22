class AssignedUsersController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @available_user = AssignedUser.new
  end

  def create
    users = params[:assigned_user][:project_id]
    project = params[:project_id]
    users.each do |user|
      if user != ''
        assigned_user = AssignedUser.new(project_id: project, user_id: user)
        assigned_user.save
      end
    end
    redirect_to project_path(project), notice: 'Staff selected were added successfully'
  end

  def destroy
    @assigned_user = AssignedUser.find(params[:id])
    if @assigned_user.destroy
      redirect_to projects_path, notice: 'User has been successfully removed'
    else
      render :show
    end
  end

  private

  def assigned_user_params
    params.require(:assigned_user).permit(:project_id, :user_id)
  end

end
