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
  end

  scenario 'user edits a task' do

    visit project_cycle_path(@project_cycle.id)
    click_on 'Edit Task'

    fill_in 'Task Name', with: 'Inventory Cycle Count'
    click_on 'Update Task'

    expect(page).to have_content 'Inventory Cycle Count'

  end

end
