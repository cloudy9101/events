class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :team_id

      t.timestamps null: false
    end
    add_index :users, :username
    add_index :users, :team_id
  end
end
