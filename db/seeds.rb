# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ cycle_name: 'Chicago' }, { cycle_name: 'Copenhagen' }])
#   Mayor.create(cycle_name: 'Emanuel', city: cities.first)

Cycle.delete_all
Status.delete_all

Cycle.create([{cycle_name: 'Cash', id: 1}, {cycle_name: 'Accounts Receivable', id: 2}, {cycle_name: 'Prepaid Assets', id: 3},
  {cycle_name: 'Inventory', id: 4}, {cycle_name: 'Capital Assets', id: 5}, {cycle_name: 'Intangible Assets', id: 6},
  {cycle_name: 'Investments', id: 7}, {cycle_name: 'Other Assets', id: 8},{cycle_name: 'Accounts Payable', id: 9},
  {cycle_name: 'Accrued Expenses', id: 10}, {cycle_name: 'Debt', id: 11}, {cycle_name: 'Equity', id: 12}, {cycle_name: 'Revenue', id: 13},
  {cycle_name: 'Operating Expenses', id: 14}, {cycle_name: 'Income Taxes', id: 15}, {cycle_name: 'Reporting', id: 16},
  {cycle_name: 'Concluding', id: 17}])

Status.create([{status_name: 'Unassigned', id: 1}, {status_name: 'Assigned', id: 2}, {status_name: 'In Progress', id: 3},
  {status_name: 'Questions', id: 4}, {status_name: 'Waiting for Client', id: 5}, {status_name: 'Ready for Review', id: 6},
  {status_name: 'Reviewed with Comments', id: 7}, {status_name: 'Closed', id: 8}])
