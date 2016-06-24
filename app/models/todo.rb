class Todo < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  belongs_to :project
  belongs_to :assigned_user, class_name: 'User'

  has_many :comments
end
