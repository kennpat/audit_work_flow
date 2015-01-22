require 'rails_helper'

feature 'Project delete', %{
  As a user I want to
  be able to delete a project
  so that I can remove duplicate or unused projects
} do

  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'A user tries to delete a project' do
    project = FactoryGirl.create(:project)
    visit project_path(project.id)

    click_on 'Delete Project'

    expect(page).to have_content('Project has been successfully deleted')

  end
end
