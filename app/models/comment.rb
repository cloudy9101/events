class Comment < ActiveRecord::Base
  belongs_to :todo
  belongs_to :user

  after_create :create_event_comment

  private

  def create_event_comment
    todo.events.create(action: 'act_comment', content: content, user_id: user_id)
  end
end
