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
      visit project_path(@project)
      click_on 'View Cycle'
      click_on 'Add Task'
      fill_in 'Task Name', with: 'Bank Reconciliation'
      fill_in 'Task Description', with: 'Compare the bank reconciliation to the
        bank statement and to the general ledger, and the confirmation received.'
      select(2, from: 'Priority')
      select('Unassigned', from: 'Status')
      click_on 'Create Task'

      expect(page).to have_content 'Task added successfully'
      expect(page).to have_content 'Bank Reconciliation'
      expect(page).to have_content '2'
      expect(page).to have_content 'Unassigned'

    end

    scenario 'A user tries to create a task without any information' do
      visit project_path(@project)
      click_on 'View Cycle'
      click_on 'Add Task'
      click_on 'Create Task'

      expect(page).to have_content "Task name can't be blank"
      expect(page).to have_content "Task description can't be blank"

    end

  end
