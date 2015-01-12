require 'rails_helper'

feature 'Registered user wants to create a new project', %{
  As a registered user I want to
  create a new project
  so that I can track the progress of work
} do

    scenario 'User creates a new project with the required information' do
      visit new_project_path
      fill_in 'Project Name', with: 'Launch Academy 2014 Audit'
      fill_in 'Project Type', with: 'Education'
      fill_in 'Project Status', with: 'Active'
      fill_in 'Project Stage', with: 'Planning'

      click_on 'Submit'

      expect(page).to have_content ('Project created successfully')

    end

    # scenario 'User tries to create a new project forgetting required information' do
    #   visit new_project_path
    #   click_on 'Submit'
    #
    #   expect(page).to have_content ("Project Name can't be blank")
    #   expect(page).to have_content ("Project Type can't be blank")
    #   expect(page).to have_content ("Project Status can't be blank")
    #   expect(page).to have_content ("Project Stage can't be blank")
    # end

end
