class User < ActiveRecord::Base
  belongs_to :team

  has_many :todos
  has_many :accesses
  has_many :events

  has_many :assigned_todos, class_name: 'Todo'
end
