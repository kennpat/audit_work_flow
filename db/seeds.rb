# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ cycle_name: 'Chicago' }, { cycle_name: 'Copenhagen' }])
#   Mayor.create(cycle_name: 'Emanuel', city: cities.first)

Cycle.delete_all
Status.delete_all

Cycle.create([{cycle_name: 'Cash'}, {cycle_name: 'Accounts Receivable'}, {cycle_name: 'Prepaid Assets'},
  {cycle_name: 'Inventory'}, {cycle_name: 'Capital Assets'}, {cycle_name: 'Intangible Assets'},
  {cycle_name: 'Investments'}, {cycle_name: 'Other Assets'},{cycle_name: 'Accounts Payable'},
  {cycle_name: 'Accrued Expenses'}, {cycle_name: 'Debt'}, {cycle_name: 'Equity'}, {cycle_name: 'Revenue'},
  {cycle_name: 'Operating Expenses'}, {cycle_name: 'Income Taxes'}, {cycle_name: 'Reporting'},
  {cycle_name: 'Concluding'}])

Status.create([{status_name: 'Unassigned'}, {status_name: 'Assigned'}, {status_name: 'In Progress'},
  {status_name: 'Questions'}, {status_name: 'Waiting for Client'}, {status_name: 'Ready for Review'},
  {status_name: 'Reviewed with Comments'}, {status_name: 'Closed'}])
