class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :team_id
      t.integer :project_id
      t.integer :user_id
      t.string :eventable_type
      t.integer :eventable_id
      t.string :target
      t.integer :action
      t.string :old_target

      t.timestamps null: false
    end
    add_index :events, :team_id
    add_index :events, :project_id
    add_index :events, :user_id
    add_index :events, :eventable_type
    add_index :events, :eventable_id
  end
end
