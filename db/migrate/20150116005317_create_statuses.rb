class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :status_name, null: false
    end
    add_index :statuses, :status_name, unique: true
  end
end
