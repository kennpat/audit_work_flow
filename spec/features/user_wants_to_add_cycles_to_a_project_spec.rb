require 'rails_helper'

feature 'User wants to add cycles to a project', %{
  As a user
  I want to be able to see all cycles that are available
  So that I can select the appropriate ones for my project
} do

  before :each do
    @project = FactoryGirl.create(:project)
  end

  scenario 'A user wants to select the available base cycles for an audit' do

    visit new_project_project_cycle_path(@project.id)

    check 'Cash'
    check 'Accounts Receivable'
    check 'Capital Assets'
    check 'Inventory'
    check 'Accounts Payable'
    check 'Accrued Expenses'
    check 'Debt'
    check 'Equity'
    check 'Revenue'
    check 'Operating Expenses'

    click_on 'Add Cycles'
    expect(page).to have_content('Cycles selected were added successfully')
    expect(page).to have_content('Cash')
    expect(page).to have_content('Accounts Receivable')
    expect(page).to have_content('Capital Assets')
    expect(page).to have_content('Inventory')
    expect(page).to have_content('Accounts Payable')
    expect(page).to have_content('Accrued Expenses')
    expect(page).to have_content('Debt')
    expect(page).to have_content('Equity')
    expect(page).to have_content('Revenue')
    expect(page).to have_content('Operating Expenses')
  end

  scenario 'User does not select any cycles and is rerouted to the project show page' do
    visit new_project_project_cycle_path(@project.id)

    click_on 'Add Cycles'
    expect(page).to_not have_content('Cash')
    expect(page).to_not have_content('Accounts Receivable')
    expect(page).to_not have_content('Capital Assets')
    expect(page).to_not have_content('Inventory')
    expect(page).to_not have_content('Accounts Payable')
    expect(page).to_not have_content('Accrued Expenses')
    expect(page).to_not have_content('Debt')
    expect(page).to_not have_content('Equity')
    expect(page).to_not have_content('Revenue')
    expect(page).to_not have_content('Operating Expenses')
  end

end
