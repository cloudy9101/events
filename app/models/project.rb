class Project < ActiveRecord::Base
  belongs_to :team

  has_many :todos
  has_many :accesses
  has_many :events
end
