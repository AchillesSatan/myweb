class Project < ActiveRecord::Base
  attr_accessible :name, :priority, :user_id

  validates :name, presence: true

  belongs_to :user, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
