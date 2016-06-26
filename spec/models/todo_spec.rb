require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe '#delete' do
    let(:todo) { create(:todo) }

    it 'will remove from visible scope' do
      todo.delete
      expect(Todo.find_by_id(todo.id)).to eq(todo)
      expect(Todo.visible.find_by_id(todo.id)).to eq(nil)
    end
  end

  describe 'create event callbacks' do
    let(:todo) { build(:todo) }
    let(:user) { create(:user) }

    context '#create' do
      it 'will create act_create event' do
        todo.save
        expect(todo.events.last.action).to eq('act_create')
      end
    end

    before { todo.save }
    context '#delete' do
      it 'will create act_delete event' do
        todo.delete
        expect(todo.events.last.action).to eq('act_delete')
      end
    end

    context '#complete' do
      it 'will create act_complete' do
        todo.update(status: :complete)
        expect(todo.events.last.action).to eq('act_complete')
      end
    end

    context '#assign user' do
      it 'will create act_assign_user' do
        todo.update(assigned_user_id: user.id)
        expect(todo.events.last.action).to eq('act_assign_user')
      end
    end

    context '#modify assigned user' do
      it 'will create act_modify_assigned_user' do
        todo.update(assigned_user_id: user.id)
        other_user = create(:user)
        todo.update(assigned_user_id: other_user.id)
        expect(todo.events.last.action).to eq('act_modify_assigned_user')
      end
    end

    context '#modify due on' do
      it 'will create act_modify_due_on' do
        todo.update(due_on: DateTime.now)
        expect(todo.events.last.action).to eq('act_modify_due_on')
      end
    end
  end
end
