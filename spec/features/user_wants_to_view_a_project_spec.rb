require 'rails_helper'
# It is likely this test will be heavily modified in the future

feature 'User would like to view an individual project', %{
  As a user I would like to
  View the details of an individual project
  So that I can see the progression of work
} do

  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'A user tries to view the details of an individual project' do
    project = FactoryGirl.create(:project)
    visit project_path(project.id)

    expect(page).to have_content(project.project_name)
    expect(page).to have_content(project.project_type)
    expect(page).to have_content(project.stage)
    expect(page).to have_content(project.status)
  end

end
