class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.string :limit_date, null: false
      t.string :goal, null: false
      t.string :next_goal
      t.string :type, null: false
      t.string :likes_count, null: false

      t.timestamps
    end
    add_index :projects, :title
    add_index :projects, :limit_date
    add_index :projects, :goal
  end
end
