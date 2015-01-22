require 'rails_helper'

feature 'A user deletes a task from a project cycle', %{
  As a user
  I want to be able to delete a task
  So that I can remove not applicable tasks as the audit changes
} do

  before :each do
    @project = FactoryGirl.create(:project)
    @project_cycle = FactoryGirl.create(:project_cycle,
    project_id: @project.id, cycle_id: 3)
    @task = FactoryGirl.create(:task, project_cycle_id: @project_cycle.id)
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'A user deletes a task' do
    visit project_cycle_path(@project_cycle.id)
    click_on 'Edit Task'
    click_on 'Delete Task'
    expect(page).to have_content('Project has been successfully deleted')

  end

end
