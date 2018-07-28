class CreateTagCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_categories do |t|
      t.integer :category_id, null: false
      t.references :tag

      t.timestamps
    end
    add_index :tag_categories, :category_id
  end
end
