require 'rails_helper'

feature 'User wants to remove a cycle from the Project', %{
  As a user
  I would like to remove a cycle
  So that I have only the ones necessary to that project
} do

  before :each do
    @project = FactoryGirl.create(:project)
  end

  scenario 'User tries to remove a cycle from an existing project' do

  end

end
