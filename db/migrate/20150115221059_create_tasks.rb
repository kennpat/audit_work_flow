class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name, null: false
      t.text :task_description, null: false
      t.integer :assigned_staff_id
      t.integer :project_cycle_id, null: false
      t.integer :priority, null: false, default: 1
      t.integer :status_id, null: false

      t.timestamps

    end
      add_index :tasks, :task_name, unique: true
  end
end
