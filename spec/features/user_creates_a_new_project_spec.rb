require 'rails_helper'
# will retrofit to ensure only correct users can view projects
feature 'User wants to create a new project', %{
  As a Registered User I want to
  create a new project
  so that I can track the progress of work to assigned staff
} do

  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'User creates a new project with the required information' do
    visit new_project_path
    fill_in 'Project Name', with: 'Launch Academy 2014 Audit'
    fill_in 'Project Type', with: 'Education'
    fill_in 'Project Status', with: 'Active'
    fill_in 'Project Stage', with: 'Planning'

    click_on 'Submit'

    expect(page).to have_content ('Project created successfully')
    expect(page).to have_content ('Launch Academy 2014 Audit')
    expect(page).to have_content ('Education')
    expect(page).to have_content ('Planning')

  end

  scenario 'User tries to create a new project forgetting required information' do
    visit new_project_path
    click_on 'Submit'
    # note that status and stage have default values
    expect(page).to have_content ("Project name can't be blank")
    expect(page).to have_content ("Project type can't be blank")
  end

  # add a test for the redirect to the index page showing all the projects
  # currently created active

end
