require 'rails_helper'

feature 'User wants to edit the Project Cycles in a Project', %{
  As a user
  I would like to remove a cycle
  So that I have only the ones necessary to that project
} do

  before :each do
    @project = FactoryGirl.create(:project)
    @project_cycle = FactoryGirl.create(:project_cycle,
      project_id: @project.id, cycle_id: 3)
  end

  scenario 'User tries to remove a Project Cycle from an existing project' do
    visit project_path(@project.id)

    click_on 'Edit Cycle'
    click_on 'Remove Cycle'

    expect(page).to have_content 'Project Cycle has been removed'

  end

end
