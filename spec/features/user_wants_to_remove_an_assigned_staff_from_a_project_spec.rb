require 'rails_helper'

feature 'User wants to remove a staff assigned to a project', %{
  As a registered user
  I want to be able to remove a staff from a project
  So that I can remove staff that were accidentally added to a project
  } do

  before :each do
    @project = FactoryGirl.create(:project)
    @user = FactoryGirl.create(:user)
    login_as(@user)
    @assigned_user = FactoryGirl.create(:assigned_user, user_id: @user.id,
      project_id: @project.id)
  end

  scenario 'User removes an assigned staff' do
    visit project_path(@project.id)
    click_on 'Remove Staff'
    expect(page).to_not have_content @user.name

  end

end
