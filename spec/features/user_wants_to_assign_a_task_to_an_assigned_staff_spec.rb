require 'rails_helper'

feature 'User adds an assigned user to a task', %{
  As a registered user
  I want to be able to assign staff to a task
  So that the staff knows which task to work on
} do

  before :each do
    # This needs to be refactored
    @project = FactoryGirl.create(:project)
    @project_cycle = FactoryGirl.create(:project_cycle,
      project_id: @project.id, cycle_id: 1)
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    login_as(@user)
    @assigned_user = FactoryGirl.create(:assigned_user, user_id: @user.id,
      project_id: @project.id)
    @assigned_user2 = FactoryGirl.create(:assigned_user, user_id: @user2.id,
      project_id: @project.id)
    @task = FactoryGirl.create(:task, project_cycle_id: @project_cycle.id)
  end

  scenario 'A user assigns a staff to an open task' do
    visit project_path(@project.id)

    click_on 'View Cycle'
    click_on 'Edit Task'
    select 'Assigned'
    select @user2.name
    click_on 'Update Task'
    expect(page).to have_content "Assigned Staff: #{@user2.name}"
  end
end
