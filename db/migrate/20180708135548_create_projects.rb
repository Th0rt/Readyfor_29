class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.date :limit_date, null: false
      t.integer :goal, null: false
      t.integer :next_goal
      t.string :project_type, null: false
      t.integer :likes_count, null: false

      t.index :title
      t.index :limit_date
      t.index :goal

      t.timestamps
    end
  end
end
