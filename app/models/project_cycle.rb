class ProjectCycle < ActiveRecord::Base
    belongs_to :project
    belongs_to :cycle
end
