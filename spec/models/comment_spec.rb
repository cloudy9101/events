require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'create event callbacks' do
    let(:comment) { build(:comment) }

    context '#create' do
      it 'will create act_comment' do
        comment.save
        expect(comment.todo.events.last.action).to eq('act_comment')
      end
    end
  end
end
