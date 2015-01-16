class Task < ActiveRecord::Base
  belongs_to :project_cycle
  has_one :status
end
