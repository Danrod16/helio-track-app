class Milestone < ApplicationRecord
  STATUS = ["Pending", "Completed", "Active"]
  belongs_to :user
  belongs_to :project
end
