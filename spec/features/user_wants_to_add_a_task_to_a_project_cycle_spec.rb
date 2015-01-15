require 'rails_helper'

feature 'Adding a task to a project cycle', %{
  As a user
  I want to be able to add a task to a cycle
  So that I can later assign it to a staff person
} do

  before :each do
    @project = FactoryGirl.create(:project)
    @project_cycle = FactoryGirl.create(:project_cycle,
    project_id: @project.id, cycle_id: 3)
  end

  scenario 'A user adds a new task to an existing project cycle' do

  end
  
end
