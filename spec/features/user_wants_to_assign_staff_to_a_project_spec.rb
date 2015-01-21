require 'rails_helper'

feature 'Assigning staff to a project', %{
  As a registered user I want to be able to
  Assign staff to a project
  So I can then assign tasks to them and track their progress
} do

  before :each do
    @project = FactoryGirl.create(:project)
    @users = FactoryGirl.create_list(:user, 4)
    login_as(@users[1])
  end

  scenario 'A user assigns available staff to a project' do
    visit project_path(@project.id)
    click_on 'Add Staff to Project'
    expect(page).to have_content @users[0].name
    expect(page).to have_content @users[1].name
    expect(page).to have_content @users[2].name
    expect(page).to have_content @users[3].name

    check @users[1].name
    check @users[2].name

    click_on 'Add Staff'

    expect(page).to have_content 'Assigned Staff:'
    expect(page).to have_content @users[1].name
    expect(page).to have_content @users[2].name

  end

end
