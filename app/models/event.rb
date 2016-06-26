class Event < ActiveRecord::Base
  belongs_to :team
  belongs_to :project
  belongs_to :user
  belongs_to :eventable, polymorphic: true

  before_save :update_team_and_project_id

  enum action: [:act_create, :act_delete, :act_complete, :act_assign_user, :act_modify_assigned_user, :act_modify_due_on, :act_comment]

  def target
    if action == 'act_modify_due_on'
      due_on_format super
    else
      super
    end
  end

  def old_target
    if action == 'act_modify_due_on'
      due_on_format super
    else
      super
    end
  end

  def due_on_format date
    if date
      DateTime.parse(date)&.strftime("%m月%d日")
    else
      '没有截止日期'
    end
  end

  private

  def update_team_and_project_id
    self.team_id = eventable.team_id
    self.project_id = eventable.project_id
  end
end
