class Todo < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  belongs_to :project
  belongs_to :assigned_user, class_name: 'User'

  has_many :comments
  has_many :events, as: :eventable

  attr_accessor :last_update_user_id
  enum status: [:uncomplete, :complete]

  after_create :create_event_create
  before_update :create_event_delete, if: Proc.new { |todo| todo.deleted_changed? && todo.deleted? }
  before_update :create_event_complete, if: Proc.new { |todo| todo.status_changed? && todo.status == 'complete' }
  before_update :create_event_assign_user, if: Proc.new { |todo| todo.assigned_user_id_changed? && !todo.assigned_user_id_was }
  before_update :create_event_modify_assigned_user, if: Proc.new { |todo| todo.assigned_user_id_changed? && todo.assigned_user_id_was }
  before_update :create_event_modify_due_on, if: Proc.new { |todo| todo.due_on_changed? }

  scope :visible, -> { where(deleted: false) }

  def delete
    update(deleted: true, deleted_at: DateTime.now)
  end

  private

  def create_event_create
    events.create(action: 'act_create', user_id: last_update_user_id)
  end

  def create_event_delete
    events.create(action: 'act_delete', user_id: last_update_user_id)
  end

  def create_event_complete
    events.create(action: 'act_complete', user_id: last_update_user_id)
  end

  def create_event_assign_user
    events.create(action: 'act_assign_user', target: assigned_user&.username, user_id: last_update_user_id)
  end

  def create_event_modify_assigned_user
    events.create(action: 'act_modify_assigned_user', target: assigned_user.username, old_target: User.find(assigned_user_id_was).username, user_id: last_update_user_id)
  end

  def create_event_modify_due_on
    events.create(action: 'act_modify_due_on', target: due_on, old_target: due_on_was, user_id: last_update_user_id)
  end
end
