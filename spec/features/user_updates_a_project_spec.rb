require 'rails_helper'

feature 'A user wishes to update a currect project', %{
  As a user
  I want to update a project
  So that my team can see the updates
} do
  
  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'A user updates a project with compliant information' do
    project = FactoryGirl.create(:project)
    visit edit_project_path(project.id)

    fill_in 'Project Name', with: 'Launch Academy 12-31-2014 Audit '
    fill_in 'Project Status', with: 'Awaiting Approval'
    fill_in 'Stage', with: 'Fieldwork'
    fill_in 'Project Type', with: 'Education Entity Financial Statement Audit'

    click_on 'Update'

    expect(page).to have_content 'Project updated successfully'
    expect(page).to have_content 'Launch Academy 12-31-2014 Audit '
    expect(page).to have_content 'Fieldwork'
    expect(page).to have_content 'Awaiting Approval'
    expect(page).to have_content 'Education Entity Financial Statement Audit'
  end

  scenario 'User tries to update with blank information' do
    project = FactoryGirl.create(:project)
    visit edit_project_path(project.id)

    fill_in 'Project Name', with: ''
    fill_in 'Project Status', with: ''
    fill_in 'Stage', with: ''
    fill_in 'Project Type', with: ''

    click_on 'Update'

    expect(page).to have_content ("Project name can't be blank")
    expect(page).to have_content ("Project type can't be blank")
    expect(page).to have_content ("Status can't be blank")
    expect(page).to have_content ("Stage can't be blank")

  end

end
