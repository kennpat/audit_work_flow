class ChangeTasksRemoveAssignedStaffId < ActiveRecord::Migration
  def change
    remove_column :tasks, :assigned_staff_id
    add_column :tasks, :user_id, :integer
  end
end
