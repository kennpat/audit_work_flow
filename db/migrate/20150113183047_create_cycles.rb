class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.string :cycle_name, null: false
    end

    create_table :project_cycles do |t|
      t.integer :project_id, null: false
      t.integer :cycle_id, null: false
    end
  end
end
