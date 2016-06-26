class Event < ActiveRecord::Base
  belongs_to :team
  belongs_to :project
  belongs_to :user
  belongs_to :eventable, polymorphic: true

  before_save :update_team_and_project_id

  enum action: [:act_create, :act_delete, :act_complete, :act_assign_user, :act_modify_assigned_user, :act_modify_due_on, :act_comment]

  private

  def update_team_and_project_id
    self.team_id = eventable.team_id
    self.project_id = eventable.project_id
  end
end
