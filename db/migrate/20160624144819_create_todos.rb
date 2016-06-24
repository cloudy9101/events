class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title, index: true
      t.string :desc
      t.integer :assigned_user_id, index: true
      t.datetime :due_on, index: true
      t.integer :status, default: 0, index: true
      t.integer :user_id, index: true
      t.integer :project_id, index: true
      t.integer :team_id, index: true
      t.boolean :deleted, default: false, index: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
