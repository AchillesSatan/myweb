class Task < ActiveRecord::Base
  attr_accessible :description, :end, :name, :project_id, :start, :user_id
  validates :name, presence: true
  
  belongs_to :project
  belongs_to :user
end
