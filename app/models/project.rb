class Project < ActiveRecord::Base
  validates :project_name, presence: true
  validates :project_type, presence: true
  validates :status, presence: true
  validates :stage, presence: true

  has_many :project_cycles
  has_many :cycles, through: :project_cycles

end
