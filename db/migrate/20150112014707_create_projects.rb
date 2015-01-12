class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name, null: false
      t.string :project_type, null: false
      t.string :status, null: false, default: 'Active'
      t.string :stage, null: false, default: 'Planning'
      t.timestamps
    end
      
  end
end
