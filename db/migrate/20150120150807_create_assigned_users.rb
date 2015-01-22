class CreateAssignedUsers < ActiveRecord::Migration
  def change
    create_table :assigned_users do |t|
      t.integer :project_id, null: false
      t.integer  :user_id, null: false
      t.timestamps
    end
    add_index :assigned_users, [:project_id, :user_id], unique: true
  end
end
