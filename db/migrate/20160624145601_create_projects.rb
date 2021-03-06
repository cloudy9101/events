class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :team_id

      t.timestamps null: false
    end
    add_index :projects, :name
    add_index :projects, :team_id
  end
end
