class Task < ActiveRecord::Base
  validates :task_name, presence: true
  validates :task_description, presence: true
  validates :project_cycle_id, presence: true
  validates :status_id, presence: true

  belongs_to :project_cycle
  has_one :status
end
