class Team < ActiveRecord::Base
  has_many :users
  has_many :projects
  has_many :todos
  has_many :events
end
