class Cycle < ActiveRecord::Base
  has_many :project_cycles
  has_many :projects, through: :project_cycles
end
