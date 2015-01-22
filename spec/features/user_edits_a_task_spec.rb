require 'rails_helper'

feature 'A user wants to edit a task', %{
  As a user
  I want to be able to update task statuses and make changes if needed
  So that my tasks are up to date with the project'
} do

  before :each do
    @project = FactoryGirl.create(:project)
    @project_cycle = FactoryGirl.create(:project_cycle,
    project_id: @project.id, cycle_id: 3)
    @task = FactoryGirl.create(:task, project_cycle_id: @project_cycle.id)
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'user edits a task' do
    visit project_cycle_path(@project_cycle.id)
    click_on 'Edit Task'

    fill_in 'Task Name', with: 'Inventory Cycle Count'
    click_on 'Update Task'

    expect(page).to have_content 'Task updated successfully'
    expect(page).to have_content 'Inventory Cycle Count'

  end

  scenario 'user tries to update a task with insufficient info' do
    visit project_cycle_path(@project_cycle.id)
    click_on 'Edit Task'

    fill_in 'Task Name', with: ''
    fill_in 'Task Description', with: ''
    click_on 'Update Task'

    expect(page).to have_content "Task name can't be blank"
    expect(page).to have_content "Task description can't be blank"
  end

end
